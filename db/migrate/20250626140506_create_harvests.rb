class CreateHarvests < ActiveRecord::Migration[8.0]
  def change
    create_table :harvests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :crop_variety, null: false, foreign_key: true
      t.decimal :harvested_weight, precision: 6, scale: 2
      t.datetime :harvested_at

      t.timestamps
    end
  end
end
