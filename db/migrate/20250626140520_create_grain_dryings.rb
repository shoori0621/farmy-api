class CreateGrainDryings < ActiveRecord::Migration[8.0]
  def change
    create_table :grain_dryings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :crop_variety, null: false, foreign_key: true
      t.decimal :dried_weight, precision: 6, scale: 2
      t.datetime :dried_at

      t.timestamps
    end
  end
end
