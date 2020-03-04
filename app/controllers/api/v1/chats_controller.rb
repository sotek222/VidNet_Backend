# frozen_string_literal: true

class Api::V1::ChatsController < ApplicationController
  def show
    chat = Chat.find(params[:id])
    render json: chat
  end

  def create
    chat = Chat.create(theatre_id: params[:theatre_id])
    render json: chat
  end
end
