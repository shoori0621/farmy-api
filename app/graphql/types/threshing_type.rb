module Types
  class ThreshingType < Types::BaseObject
    field :id, ID, null: false
    field :threshing_date, GraphQL::Types::ISO8601Date, null: false
    field :method, String, null: true, method_conflict_warning: false
    field :yield_ratio, Float, null: true
    field :cost, Float, null: true
    field :harvest_id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :harvest, Types::HarvestType, null: false
  end
end
