class Api::V1::MessagesController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    messages = Message.all

    render json: messages
  end

  def create
    message = Message.create(message_params)
    inbox = Inbox.find(params[:message]["inbox_id"])
    InboxChannel.broadcast_to(inbox, message)
    render json: { message: MessageSerializer.new(message) }, status: :accepted
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
