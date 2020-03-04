class InboxChannel < ApplicationCable::Channel
  def subscribed
    inbox = Inbox.find_by(id: params[:inbox_id])

    stream_for inbox
  end

  def unsubscribed
    raise "huh?"
  end
end
