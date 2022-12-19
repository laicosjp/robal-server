class Api::V1::UsersController < ApplicationController
  def show
    @user = User.find(params[:hash_id])
    render json: @user, status: :ok
  end
end
