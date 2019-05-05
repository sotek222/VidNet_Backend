class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :create]

  def index
    @users = User.all

    render json: @users
  end

  def show
    @user = User.find(params[:id])

    render json: @user
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    user = User.create(user_params)
    if user.valid?
      Inbox.create(user_id: user.id)
      token = encode_token({user_id: user.id, name: user.username})
      render json: { user: UserSerializer.new(user), jwt: token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end

  end

  def update
    user = User.find(params[:id])
    user.update(image: params[:image], email: params[:email])
    render json: { user: UserSerializer.new(user) }, status: :accepted
  end

  def destroy
    user = User.find(params[:id])

    user.destroy
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :image)
  end
end
