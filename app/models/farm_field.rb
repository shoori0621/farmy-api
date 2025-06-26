class FarmField < ApplicationRecord
  belongs_to :user
  belongs_to :farm_field_category
end
