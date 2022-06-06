class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true, index: true
      t.string :title
      t.string :text
      t.timestamps
      t.integer :comments_counter
      t.integer :likes_counter
    end
    # add_reference :posts, :user, null: false, foreign_key: true
  end
end
