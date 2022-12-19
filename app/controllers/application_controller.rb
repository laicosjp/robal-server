class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  include DeviseTokenAuth::Concerns::SetUserByToken

  def current_user
    @current_user ||= current_api_v1_user
  end
end
