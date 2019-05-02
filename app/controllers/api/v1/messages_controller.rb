class Api::V1::MessagesController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    messages = Message.all

    render json: messages
  end

  def create
    message = Message.create(message_params)

    render json: message
  end

  def destroy
    message = Message.find(params[:id])

    message.destroy
    render json: message
  end

  private

  def message_params
    params.require(:message).permit(:sender_id, :inbox_id, :link, :content)
  end
end
