class SearchController < ApplicationController
  before_action :authenticate_user!
  def index
    @query = Calorie.where('user_id=(?)', current_user.id).ransack(params[:q])
    @calories = @query.result(distinct: true).order(updated_at: :desc).page(params[:page])
    @total_results = @query.result(distinct: true).count
  end
end
