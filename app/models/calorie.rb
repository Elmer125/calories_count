class Calorie < ApplicationRecord
  enum burned_or_consumed: %i[burned consumed]
  belongs_to :user, counter_cache: true
  validates :calories_number, presence: true, numericality: { only_integer: true }
  validates :comment, presence: true, length: { maximum: 200 }
  validates :burned_or_consumed, presence: true
  paginates_per 12

  ransacker :date_updated_as_str do
    Arel.sql("to_char(\"#{table_name}\".\"updated_at\", 'YYYY-MM-DD HH24:MI:SS')")
  end
end
