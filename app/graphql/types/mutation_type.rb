# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_farm_field, mutation: Mutations::CreateFarmField
    field :create_work_log, mutation: Mutations::CreateWorkLog
    field :create_harvest, mutation: Mutations::CreateHarvest
  end
end
