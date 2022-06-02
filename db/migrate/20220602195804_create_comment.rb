class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, index: true
      t.references :post, foreign_key: true, index: true
      t.string :text
      t.timestamps
    end
    # add_reference :comments, :user, null: false, foreign_key: true
    # add_reference :comments, :post, null: false, foreign_key: true
  end
end
