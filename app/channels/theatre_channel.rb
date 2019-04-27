class TheatreChannel < ApplicationCable::Channel
  def subscribed
    theatre = Theatre.find_by(id: params[:theatre_id])

    stream_for theatre
  end

  def unsubscribed
    # puts "unsub"
    # x = Theatre.find(params[:theatre_id])
    # x.unsubscribe()
    raise "huh?"
    # Any cleanup needed when channel is unsubscribed
  end
end
