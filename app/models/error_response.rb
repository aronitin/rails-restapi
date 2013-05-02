class ErrorResponse
  def initialize(data, status)
    @data = data
    @status = status
  end

  def to_json
    {:data => @data, :status => @status}
  end
end
