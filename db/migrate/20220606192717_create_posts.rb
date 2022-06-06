class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :author, foreign_key: { to_table: :users }, index: true
      t.string :title
      t.string :text
      t.timestamps
      t.integer :comments_counter
      t.integer :likes_counter
    end
  end
end
