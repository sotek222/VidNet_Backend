class Api::V1::TheatresController < ApplicationController
  skip_before_action :authorized, only: [:show, :update]

  def index
    theatres = Theatre.all
    render json: theatres
  end

  def create
    theatre = Theatre.create(theatre_params)
    render json: theatre
  end

  def show
    theatre = Theatre.find(params[:id])
    TheatreChannel.broadcast_to(theatre, theatre)
    render json: theatre
  end

  def update
    theatre = Theatre.find(params[:id])
    theatre.update(playing: params[:playing], muted: params[:muted], elapsed_time: params[:elapsed_time])
    TheatreChannel.broadcast_to(theatre, theatre)
    render json: theatre
  end

  def destroy
    theatre = Theatre.find(params[:id])
    theatre.destroy
    render json: theatre
  end

  private

  def theatre_params
    params.require(:theatre).permit(:host_id, :src, :text_chat, :audio_chat, :video_chat, :is_public, :playing, :muted, :elapsed_time)
  end

end
