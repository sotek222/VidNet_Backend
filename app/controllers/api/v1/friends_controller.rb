class Api::V1::FriendsController < ApplicationController

  def index
    friends = Friend.all

    render json: friends
  end

  def create
    friend = Friend.create(friender_id: params[:friender_id], friendee_id: params[:friendee_id])
    render json: friend
  end

  def destroy
    friendShip = Friend.find(params[:id])
    friendShip.destroy
    render json: friendShip
  end
end
