class WorkLog < ApplicationRecord
  belongs_to :user
  belongs_to :farm_field
end
