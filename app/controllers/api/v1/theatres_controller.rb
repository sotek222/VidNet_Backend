class Api::V1::TheatresController < ApplicationController

  def create
    theatre = Theatre.create(theatre_params)
    # TheatreChannel.broadcast_to(theatre, state)
    render json: theatre
  end

  def show
    theatre = Theatre.find(params[:id])
    # byebug
    # TheatreChannel.broadcast_to(theatre, {data: "Test"})
    render json: theatre
  end

  def update
    theatre = Theatre.find(params[:id])
    theatre.update(theatre_params)
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
    params.require(:theatre).permit(:host_id, :src, :text_chat, :audio_chat, :video_chat, :is_public, :playing, :muted, :volume, :elapsed_time)
  end

end
