class CreateExpenses < ActiveRecord::Migration[8.0]
  def change
    create_table :expenses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :expense_category, null: false, foreign_key: true
      t.decimal :amount_excl_tax
      t.decimal :amount_incl_tax
      t.decimal :tax_rate, precision: 4, scale: 3
      t.string :expense_destination_name
      t.text :memo
      t.datetime :expense_at

      t.timestamps
    end
  end
end
