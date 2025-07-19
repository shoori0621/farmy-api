module Types
  class FarmFieldType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :size, Float, null: true
    field :location, String, null: true
    field :user_id, ID, null: false
    field :farm_field_category_id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :user, Types::UserType, null: false
    field :farm_field_category, Types::FarmFieldCategoryType, null: false
    field :work_logs, [ Types::WorkLogType ], null: true
    field :harvests, [ Types::HarvestType ], null: true
  end
end
