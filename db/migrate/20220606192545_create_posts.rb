class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true, index: true
      t.string :title
      t.string :text, :default => ''
      t.integer :comments_counter, :default => 0
      t.integer :likes_counter, :default => 0
      t.timestamps
    end
  end
end
