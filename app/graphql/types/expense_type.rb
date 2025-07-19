module Types
  class ExpenseType < Types::BaseObject
    field :id, ID, null: false
    field :amount, Float, null: false
    field :description, String, null: true
    field :expense_date, GraphQL::Types::ISO8601Date, null: false
    field :user_id, ID, null: false
    field :expense_category_id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :user, Types::UserType, null: false
    field :expense_category, Types::ExpenseCategoryType, null: false
  end
end
