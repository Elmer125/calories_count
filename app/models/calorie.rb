class Calorie < ApplicationRecord
  enum burned_or_consumed: %i[burned consumed]
  validates :calories_number, presence: true, numericality: { only_integer: true }
  validates :comment, presence: true, length: { maximum: 200 }
  validates :burned_or_consumed, presence: true
  paginates_per 12
end
