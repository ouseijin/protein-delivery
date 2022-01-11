class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :menu, null: true, foreign_key: true
      t.references :review, null: true, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
      t.index ["menu_id", "user_id"], name: "idx_menu_id_user_id", unique: true
      t.index ["review_id", "user_id"], name: "idx_review_id_user_id", unique: true
    end
  end
end
