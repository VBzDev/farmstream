class VideosController < ApplicationController
  include VideosHelper
  
  def create
    @room = Room.find_by(access_key: params[:room_access_key])
    @video = @room.videos.build( video_params )

    if @video.save
      redirect_to room_by_access_key_path(access_key: @room.access_key), notice: "Vídeo adicionado com sucesso!"
    else
      render "rooms/show"
    end
  end

  def destroy
    @room = Room.find(params[:room_id])
    @video = @room.videos.find(params[:id])
    @video.destroy
    redirect_to @room
  end

  private

  def video_params
    permitted_params = params.require(:video).permit(:video_id)
    
    permitted_params[:video_id] = format_video_id(permitted_params[:video_id])
    
    permitted_params
  end

  def format_video_id(video)
    formatted_id = YouTubeAddy.extract_video_id(video)
    formatted_id if video_exist?(formatted_id)
  end
end
