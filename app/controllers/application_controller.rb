class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  include DeviseTokenAuth::Concerns::SetUserByToken

  private

    def current_user
      @current_user ||= current_api_v1_user
    end

    # 400 Bad Request
    def response_bad_request
      render status: 400, json: { status: 400, message: 'Bad Request' }
    end

    # 401 Unauthorizedp
    def response_unauthorized
      render status: 401, json: { status: 401, message: 'Unauthorized' }
    end

    # 404 Not Found
    def response_not_found(class_name = 'page')
      render status: 404, json: { status: 404, message: "#{class_name.capitalize} Not Found" }
    end

    # 409 Conflict
    def response_conflict(class_name)
      render status: 409, json: { status: 409, message: "#{class_name.capitalize} Conflict" }
    end

    # 500 Internal Server Error
    def response_internal_server_error
      render status: 500, json: { status: 500, message: 'Internal Server Error' }
    end
end
