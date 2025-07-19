module Mutations
  class CreateWorkLog < BaseMutation
    description "Create a new work log"

    argument :work_date, GraphQL::Types::ISO8601Date, required: true
    argument :work_type, String, required: true
    argument :description, String, required: false
    argument :hours, Float, required: false
    argument :user_id, ID, required: true
    argument :farm_field_id, ID, required: true
    argument :crop_variety_id, ID, required: false

    field :work_log, Types::WorkLogType, null: true
    field :errors, [ String ], null: false

    def resolve(work_date:, work_type:, user_id:, farm_field_id:, description: nil, hours: nil, crop_variety_id: nil)
      work_log = WorkLog.new(
        work_date: work_date,
        work_type: work_type,
        description: description,
        hours: hours,
        user_id: user_id,
        farm_field_id: farm_field_id,
        crop_variety_id: crop_variety_id
      )

      if work_log.save
        {
          work_log: work_log,
          errors: []
        }
      else
        {
          work_log: nil,
          errors: work_log.errors.full_messages
        }
      end
    end
  end
end
