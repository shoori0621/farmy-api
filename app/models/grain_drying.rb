class GrainDrying < ApplicationRecord
  belongs_to :user
  belongs_to :crop_variety
end
