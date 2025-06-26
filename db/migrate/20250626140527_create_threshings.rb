class CreateThreshings < ActiveRecord::Migration[8.0]
  def change
    create_table :threshings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :crop_variety, null: false, foreign_key: true
      t.decimal :threshed_weight, precision: 6, scale: 2
      t.datetime :threshed_at

      t.timestamps
    end
  end
end
