class CreateFarmFieldCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :farm_field_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
