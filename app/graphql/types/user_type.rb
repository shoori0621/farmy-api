module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :farm_fields, [ Types::FarmFieldType ], null: true
    field :work_logs, [ Types::WorkLogType ], null: true
    field :harvests, [ Types::HarvestType ], null: true
    field :incomes, [ Types::IncomeType ], null: true
    field :expenses, [ Types::ExpenseType ], null: true
  end
end
