class Api::ApiController < ApplicationController
  respond_to :json, :xml

  rescue_from Exception, :with => :error_render

  def error_render(exception)
    respond_to do |type|
      @error = Hash.new
      @error[:error] = true
      @error[:statusCode] = exception.status_code if exception.respond_to?('status_code')
      # @error[:message] = exception.
      # @error[:exception] = exception.to_s
      # @error[:code] = exception.code if exception.respond_to?('code')

      if !@error[:code]
        case exception
          when ActiveRecord::RecordNotFound
            @error[:code] = 404
          else
            @error[:code] = 500
        end
      end

      # TODO: Log the exception as well before leaving the method

      type.json { render "api/error", :status => @error[:statusCode] }
      type.all { render :nothing => true, :status => 404 }
    end
  end


  class ApiError < StandardError
    def initialize(message, statusCode)
      @message = message
      @statusCode = statusCode
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
      super(message, 400)
    end
  end

end
