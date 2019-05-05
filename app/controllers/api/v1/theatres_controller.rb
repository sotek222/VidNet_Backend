class Api::V1::TheatresController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :update]

  def index
    theatres = Theatre.all
    render json: theatres
  end

  def create
    theatre = Theatre.create(theatre_params)

    if theatre.valid? && params[:theatre][:text_chat]
      chat = Chat.create(theatre_id: theatre.id)
      render json: theatre
    else
      render json: theatre
    end
  end

  def show
    theatre = Theatre.find(params[:id])
    TheatreChannel.broadcast_to(theatre, theatre)
    render json: theatre
  end

  def update
    theatre = Theatre.find(params[:id])
    if request.headers[:seeking]
      theatre.update(playing: params[:playing], muted: params[:muted], elapsed_time: params[:elapsed_time])
      TheatreChannel.broadcast_to(theatre, {time: params[:elapsed_time]})
    else
      theatre.update(playing: params[:playing], muted: params[:muted], elapsed_time: params[:elapsed_time])
      TheatreChannel.broadcast_to(theatre, theatre)
    end
    render json: theatre
  end

  def destroy
    theatre = Theatre.find(params[:id])
    theatre.destroy
    render json: theatre
  end

  private

  def theatre_params
    params.require(:theatre).permit(:host_id, :src, :text_chat, :audio_chat, :video_chat, :is_public, :playing, :muted, :elapsed_time, :title)
  end

end
