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
    # using specific params to change the response from actioncable
    # if the params[:seek] or whatever, then broadcast that message
    # on the frontend, use control flow in the on recieved. If seek is sent back then
    # seek to that time. 
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
