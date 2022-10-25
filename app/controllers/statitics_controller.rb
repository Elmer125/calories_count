class StatiticsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :validate_token, only: %i[validate graph]

  def graph
    id = current_user&.id || @email_link.user_id
    @user = User.find(id)
    calories = Calorie.where(user_id: id).group(:burned_or_consumed)
    @calories_graph = calories.group_by_day(:created_at).sum(:calories_number)
  end

  def new
    @share_graph = Statitic.new
  end

  def create
    # user_id = current_user.id
    @share_graph = Statitic.new(statitic_params)
    @share_graph.token = Statitic.generate_token
    @share_graph.expires_date = DateTime.now + 1.week
    @share_graph.user = current_user
    if @share_graph.save
      redirect_to statitics_path, notice: 'Graph was successfully shared.'
    else
      render :new, status: :unprocessable_entity
    end
    # redirect_to statitics_path, notice: 'Graph was successfully shared.' if @share_graph
  end

  def validate
    return redirect_to new_user_session_path, alert: 'Link expired' unless @email_link

    redirect_to statitics_path(nt: @email_link.token)
  end

  private

  def validate_token
    @email_link = Statitic.where(token: params[:nt]).where('expires_date > (?)', DateTime.now).first
  end

  def statitic_params
    params.require(:statitic).permit(:email)
  end
end
