module Mutations
  class CreateHarvest < BaseMutation
    description "Create a new harvest"

    argument :harvest_date, GraphQL::Types::ISO8601Date, required: true
    argument :quantity, Float, required: true
    argument :unit, String, required: true
    argument :quality_grade, String, required: false
    argument :notes, String, required: false
    argument :user_id, ID, required: true
    argument :farm_field_id, ID, required: true
    argument :crop_variety_id, ID, required: true

    field :harvest, Types::HarvestType, null: true
    field :errors, [ String ], null: false

    def resolve(harvest_date:, quantity:, unit:, user_id:, farm_field_id:, crop_variety_id:, quality_grade: nil, notes: nil)
      harvest = Harvest.new(
        harvest_date: harvest_date,
        quantity: quantity,
        unit: unit,
        quality_grade: quality_grade,
        notes: notes,
        user_id: user_id,
        farm_field_id: farm_field_id,
        crop_variety_id: crop_variety_id
      )

      if harvest.save
        {
          harvest: harvest,
          errors: []
        }
      else
        {
          harvest: nil,
          errors: harvest.errors.full_messages
        }
      end
    end
  end
end
