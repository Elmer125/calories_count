class StatiticsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def graph
    id = params[:user_id] || current_user.id
    @user = User.find(id)
    calories = Calorie.where(user_id: id)
    @calories_graph = calories.group(:burned_or_consumed).group_by_day(:created_at,
                                                                       range: 1.month.ago.midnight..Time.now.midnight).sum(:calories_number)
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
    email_link = Statitic.where(token: params[:token]).where('expires_date > (?)', DateTime.now).first

    return redirect_to new_user_session_path, alert: 'Link expired' unless email_link

    redirect_to statitics_path(user_id: email_link.user_id)
  end

  private

  def statitic_params
    params.require(:statitic).permit(:email)
  end
end
