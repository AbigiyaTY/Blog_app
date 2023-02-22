class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :author, foreign_key: { to_table: :users }
    add_reference :comments, :author, foreign_key: { to_table: :users }
    add_reference :comments, :post, foreign_key: true
    add_reference :likes, :author, foreign_key: { to_table: :users }
    add_reference :likes, :post, foreign_key: true
  end
end
