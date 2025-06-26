class CreateIncomes < ActiveRecord::Migration[8.0]
  def change
    create_table :incomes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :crop_variety, null: false, foreign_key: true
      t.decimal :amount
      t.references :income_category, null: false, foreign_key: true
      t.string :income_source_name
      t.text :memo
      t.datetime :income_at

      t.timestamps
    end
  end
end
