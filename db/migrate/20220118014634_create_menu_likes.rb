class CreateMenuLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_likes do |t|
      t.references :menu, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
      t.index ["menu_id", "user_id"], name: "idx_menu_id_user_id", unique: true
    end
  end
end
