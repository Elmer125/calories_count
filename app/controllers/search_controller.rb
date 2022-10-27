class SearchController < ApplicationController
  before_action :authenticate_user!
  def index
    params[:q] ||= {}
    if params[:q][:created_at_lteq].present?
      params[:q][:created_at_lteq] = params[:q][:created_at_lteq].to_date.end_of_day
    end
    if params[:q][:created_at_gteq] > params[:q][:created_at_lteq]
      redirect_to root_path, alert: 'the start date must be before or equal the end date'
    end
    @query = Calorie.where('user_id=(?)', current_user.id).ransack(params[:q])
    @calories = @query.result(distinct: true).order(created_at: :asc).page(params[:page])
    @total_results = @query.result(distinct: true).count
  end
end
