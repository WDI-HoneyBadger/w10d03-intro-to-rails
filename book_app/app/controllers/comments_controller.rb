class CommentsController < ApplicationController
  before_action :require_user
  before_action :set_comment, only: [:update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @book = Book.find(params[:comment][:book_id])
    unless @comment.save
      flash[:comment] = @comment.errors.messages
    end
    redirect_back fallback_location: @book
  end

  def update
    unless @comment.update(comment_params)
      flash[:comment] = @comment.errors.messages
    end
    redirect_back fallback_location: @comment.book
  end

  def destroy
    @comment.destroy
    redirect_back fallback_location: @comment
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:content, :user_id, :book_id)
  end
end
