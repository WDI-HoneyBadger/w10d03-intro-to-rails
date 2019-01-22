class User < ApplicationRecord
  has_secure_password
  has_many :comments, :dependent => :destroy
  before_validation :downcase_email
  validates :email,
      presence: true,
      uniqueness: true,
      format: {
        with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/,
        message: "Invalid email address"
      }
  validates :password_confirmation, presence: true
  validates :password, confirmation: true
  validates :name, presence: true
  validates :avatar, presence: true, format: {
    with:  URI::regexp(%w(http https)),
    message: "please insert a image url"
  }

  private
  def downcase_email
    self.email = email.downcase if email.present?
  end
end
