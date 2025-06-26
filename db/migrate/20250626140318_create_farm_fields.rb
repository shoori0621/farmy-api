class CreateFarmFields < ActiveRecord::Migration[8.0]
  def change
    create_table :farm_fields do |t|
      t.references :user, null: false, foreign_key: true
      t.references :farm_field_category, null: false, foreign_key: true
      t.string :name
      t.decimal :size, precision: 6, scale: 2
      t.string :location

      t.timestamps
    end
  end
end
