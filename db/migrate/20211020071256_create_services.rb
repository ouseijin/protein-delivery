class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.string :service_url, null: false
      t.string :service_image, null: false

      t.timestamps
    end
  end
end
