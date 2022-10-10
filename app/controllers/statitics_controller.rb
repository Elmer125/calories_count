class StatiticsController < ApplicationController
  before_action :authenticate_user!
  def graph
    calories = Calorie.where(user_id: current_user.id)
    @calories_graph = calories.group(:burned_or_consumed).group_by_day(:created_at,
                                                                       range: 1.month.ago.midnight..Time.now.midnight).sum(:calories_number)
  end
end
