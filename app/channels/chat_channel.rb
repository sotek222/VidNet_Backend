# frozen_string_literal: true

class ChatChannel < ApplicationCable::Channel
  def subscribed
    chat = Chat.find_by(id: params[:chat_id])

    stream_for chat
  end

  def unsubscribed
    raise 'huh?'
  end
end
