class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.integer :calorie, null: false
      t.float :protein, null: false
      t.float :fat, null: false
      t.float :carb, null: false
      t.string :menu_image
      t.string :size
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
