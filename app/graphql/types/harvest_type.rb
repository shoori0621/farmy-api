module Types
  class HarvestType < Types::BaseObject
    field :id, ID, null: false
    field :harvest_date, GraphQL::Types::ISO8601Date, null: false
    field :quantity, Float, null: false
    field :unit, String, null: false
    field :quality_grade, String, null: true
    field :notes, String, null: true
    field :user_id, ID, null: false
    field :farm_field_id, ID, null: false
    field :crop_variety_id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :user, Types::UserType, null: false
    field :farm_field, Types::FarmFieldType, null: false
    field :crop_variety, Types::CropVarietyType, null: false
    field :grain_dryings, [ Types::GrainDryingType ], null: true
    field :threshings, [ Types::ThreshingType ], null: true
  end
end
