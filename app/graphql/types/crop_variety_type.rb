module Types
  class CropVarietyType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :category, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :work_logs, [ Types::WorkLogType ], null: true
    field :harvests, [ Types::HarvestType ], null: true
  end
end
