class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :pages
      t.belongs_to :author, foreign_key: true, index: true
      t.string :genre

      t.timestamps
    end
  end
end
