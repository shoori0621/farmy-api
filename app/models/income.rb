class Income < ApplicationRecord
  belongs_to :user
  belongs_to :crop_variety
  belongs_to :income_category
end
