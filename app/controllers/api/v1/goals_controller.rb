class Api::V1::GoalsController < Api::ApiController
  def index
    @goals = Goal.all
  end

  def create
    @goal = Goal.new(params[:goal])

    puts @goal.errors.messages.nil?

    # if @goal.save
    #   respond_with @goal, :location => api_v1_goals_url
    # else
    #   raise BadInput.new(@goal.errors.messages) unless @goal.errors.messages.nil?
    # end
  end
end
