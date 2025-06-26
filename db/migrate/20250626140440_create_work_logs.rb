class CreateWorkLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :work_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :farm_field, null: false, foreign_key: true
      t.string :work_name
      t.text :memo
      t.datetime :worked_at

      t.timestamps
    end
  end
end
