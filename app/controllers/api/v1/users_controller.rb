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
    byebug
    user = User.create(user_params)
    if user.valid?
      token = encode_token({user_id: user.id, name: user.username})
      render json: { user: UserSerializer.new(user), jwt: token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end

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

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :image, :location)
  end
end
