class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def create
    @user = User.new(username: params[:username])

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @user
  end

  private

  def set_user
    @user = User.find_by(user_params)
  end

  def user_params
    params.permit(:username, :id)
  end
end
