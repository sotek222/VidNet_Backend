class Api::V1::FriendsController < ApplicationController

  def index
    friends = Friend.all

    render json: friends
  end

  def create
    friend = Friend.create(friender_id: params[:friender_id], friendee_id: params[:friendee_id])
    render json: friend
  end

  def filtered
    friends = Friend.all.select do |friend|
      friend.friender_id == params[:user_id]
    end
    render json: friends
  end

  def destroy
    friendship = Friend.find_by(friender_id: params[:user_id], friendee_id: params[:friend_id])
    friendship.destroy
    render json: friendship
  end
end
