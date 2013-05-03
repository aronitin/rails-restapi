class Api::V1::GoalsController < Api::ApiController
  def index
    if params[:count].nil?
      per_page = 2
    else
      per_page = params[:count].to_i
    end

    if params[:offset].nil? || params[:offset] == "0"
      page = 1
    else
      page = params[:offset].to_i/per_page + 1
    end

    @goals = Goal.paginate(:page => page, :per_page => per_page)
    # @goals = Goal.all
    # puts @goals.respond_to?('total_pages')
  end

  def create
    @goal = Goal.new(params[:goal])

    if @goal.save
      respond_with @goal, :location => api_v1_goals_url
    else
      raise BadInput.new(@goal.errors.full_messages) unless @goal.errors.messages.nil?
    end
  end
end
