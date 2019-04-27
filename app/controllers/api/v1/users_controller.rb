class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all

    render json: @users
  end

  def show
    @user = User.find(params[:id])

    render json: @user
  end

  def create
    user = User.create(username: params[:username], password: params[:password], email: params[:email], image: params[:image], location: params[:location])

    render json: user
  end

  def update
    user = User.find(params[:id])
    # Must update password, not username
    user.update(image: params[:image], email: params[:email], location: params[:location])
    render json: user
  end

  def delete
    user = User.find(params[:id])
    user.destroy
    render json: user
  end
end
