class Api::V1::TextsController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def index
    texts = Text.all
    render json: texts
  end

  def create
    text = Text.new(text_params)
    chat = Chat.find(params[:text]["chat_id"])
    ChatChannel.broadcast_to(chat, TextSerializer.new(text))
    render json: text
  end

  private

  def text_params
    params.require(:text).permit(:user_id, :chat_id, :content)
  end

end
