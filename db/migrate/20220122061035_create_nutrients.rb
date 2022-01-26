class CreateNutrients < ActiveRecord::Migration[6.0]
  def change
    create_table :nutrients do |t|
      t.references :menu, null: false, foreign_key: true
      t.integer :calorie, null: false
      t.float :protein, null: false
      t.float :fat, null: false
      t.float :carb, null: false
      t.string :size

      t.timestamps
    end
  end
end
