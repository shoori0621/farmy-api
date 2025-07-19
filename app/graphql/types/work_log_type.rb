module Types
  class WorkLogType < Types::BaseObject
    field :id, ID, null: false
    field :work_date, GraphQL::Types::ISO8601Date, null: false
    field :work_type, String, null: false
    field :description, String, null: true
    field :hours, Float, null: true
    field :user_id, ID, null: false
    field :farm_field_id, ID, null: false
    field :crop_variety_id, ID, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :user, Types::UserType, null: false
    field :farm_field, Types::FarmFieldType, null: false
    field :crop_variety, Types::CropVarietyType, null: true
  end
end
