class Api::V1::GoalsController < Api::ApiController
  def index
    respond_with @goals = Goal.all
  end

  def create
    @goal = Goal.new(params[:goal])

    if @goal.save
      respond_with @goal, :location => api_v1_goals_url
    else
      respond_with @goal.errors, status: :unprocessable_entity
    end
  end
end
