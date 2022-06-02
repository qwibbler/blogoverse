class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true, index: true
      t.references :post, foreign_key: true, index: true
      t.timestamps
    end
    # add_reference :likes, :user, null: false, foreign_key: true
    # add_reference :likes, :post, null: false, foreign_key: true
  end
end
