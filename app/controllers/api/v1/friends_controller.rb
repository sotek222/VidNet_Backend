class Api::V1::FriendsController < ApplicationController

  def index
    friends = Friend.all

    render json: friends
  end

  def create
    friend = Friend.create(friender_id: params[:user_id], friendee_id: params[:friend_id])
    render json: friend
  end
end
