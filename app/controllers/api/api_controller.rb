class Api::ApiController < ApplicationController
  respond_to :json, :xml

  rescue_from Exception, :with => :error_render

  def error_render(exception)
    respond_to do |format|
      @error = Hash.new
      @error[:error] = true

      if exception.kind_of?(Api::ApiController::ApiError) #Logical ApiError code
        @error[:code] = exception.code
        @error[:message] = exception.message
        @error[:status_code] = exception.status_code
      else #For all other errors
        case exception
          when ActiveRecord::RecordNotFound
            @error[:code] = 404
            @error[:status_code] = 404
          else #For unknown errors
            # Log the unknown exception and notify
            # TODO: Deliver the unknown exception notification
            logger.error exception.message
            exception.backtrace.each { |line| logger.error line }
            @error[:code] = 500
            @error[:message] = "Unknown error occurred on the server."
            @error[:status_code] = 500
        end
      end

      #Specify the formats that need to be handled
      format.json { render "api/error", :status => @error[:status_code] }
      format.xml { render "api/error", :status => @error[:status_code] }
      format.all { render :nothing => true, :status => 404 }
    end
  end

  class ApiError < StandardError
    def initialize(code, message, statusCode)
      @code = code
      @message = message
      @statusCode = statusCode
    end

    def code
      @code
    end

    def message
      @message
    end

    def status_code
      @statusCode
    end
  end

  class BadInput < ApiError
    def initialize(message)
      super(400, message, 400)
    end
  end

end
