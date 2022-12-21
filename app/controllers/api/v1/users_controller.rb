class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_api_v1_user!, only: [:update]

  def show
    render json: @user, status: :ok
  end

  def update
    if current_user.update(user_params)
      render json: current_user, status: :ok
    else
      render json: current_user.errors.full_messages, status: 500
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :nickname, :email, :web_url, :twitter_url, :position, :bio, :country, :city)
    end

    def set_user
      @user = User.find_by(hash_id: params[:hash_id])
      response_not_found(:user) if @user.blank?
    end
end
