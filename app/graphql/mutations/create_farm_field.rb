module Mutations
  class CreateFarmField < BaseMutation
    description "Create a new farm field"

    argument :name, String, required: true
    argument :size, Float, required: false
    argument :location, String, required: false
    argument :user_id, ID, required: true
    argument :farm_field_category_id, ID, required: true

    field :farm_field, Types::FarmFieldType, null: true
    field :errors, [ String ], null: false

    def resolve(name:, user_id:, farm_field_category_id:, size: nil, location: nil)
      farm_field = FarmField.new(
        name: name,
        size: size,
        location: location,
        user_id: user_id,
        farm_field_category_id: farm_field_category_id
      )

      if farm_field.save
        {
          farm_field: farm_field,
          errors: []
        }
      else
        {
          farm_field: nil,
          errors: farm_field.errors.full_messages
        }
      end
    end
  end
end
