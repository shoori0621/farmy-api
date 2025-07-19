module Types
  class GrainDryingType < Types::BaseObject
    field :id, ID, null: false
    field :start_date, GraphQL::Types::ISO8601Date, null: false
    field :end_date, GraphQL::Types::ISO8601Date, null: true
    field :initial_moisture, Float, null: true
    field :final_moisture, Float, null: true
    field :method, String, null: true, method_conflict_warning: false
    field :cost, Float, null: true
    field :harvest_id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :harvest, Types::HarvestType, null: false
  end
end
