# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [ Types::NodeType, null: true ], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ ID ], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :users, [ Types::UserType ], null: false, description: "Get all users"
    field :user, Types::UserType, null: true, description: "Get a user by ID" do
      argument :id, ID, required: true
    end

    field :farm_fields, [ Types::FarmFieldType ], null: false, description: "Get all farm fields"
    field :farm_field, Types::FarmFieldType, null: true, description: "Get a farm field by ID" do
      argument :id, ID, required: true
    end

    field :crop_varieties, [ Types::CropVarietyType ], null: false, description: "Get all crop varieties"
    field :crop_variety, Types::CropVarietyType, null: true, description: "Get a crop variety by ID" do
      argument :id, ID, required: true
    end

    field :work_logs, [ Types::WorkLogType ], null: false, description: "Get all work logs"
    field :work_log, Types::WorkLogType, null: true, description: "Get a work log by ID" do
      argument :id, ID, required: true
    end

    field :harvests, [ Types::HarvestType ], null: false, description: "Get all harvests"
    field :harvest, Types::HarvestType, null: true, description: "Get a harvest by ID" do
      argument :id, ID, required: true
    end

    field :incomes, [ Types::IncomeType ], null: false, description: "Get all incomes"
    field :income, Types::IncomeType, null: true, description: "Get an income by ID" do
      argument :id, ID, required: true
    end

    field :expenses, [ Types::ExpenseType ], null: false, description: "Get all expenses"
    field :expense, Types::ExpenseType, null: true, description: "Get an expense by ID" do
      argument :id, ID, required: true
    end

    # Resolver methods
    def users
      User.all
    end

    def user(id:)
      User.find_by(id: id)
    end

    def farm_fields
      FarmField.all
    end

    def farm_field(id:)
      FarmField.find_by(id: id)
    end

    def crop_varieties
      CropVariety.all
    end

    def crop_variety(id:)
      CropVariety.find_by(id: id)
    end

    def work_logs
      WorkLog.all
    end

    def work_log(id:)
      WorkLog.find_by(id: id)
    end

    def harvests
      Harvest.all
    end

    def harvest(id:)
      Harvest.find_by(id: id)
    end

    def incomes
      Income.all
    end

    def income(id:)
      Income.find_by(id: id)
    end

    def expenses
      Expense.all
    end

    def expense(id:)
      Expense.find_by(id: id)
    end
  end
end
