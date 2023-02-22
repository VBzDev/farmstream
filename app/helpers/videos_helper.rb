require 'google/apis/youtube_v3'
require 'dotenv/load'

module VideosHelper
  
  def video_exist?(formatted_id)
    return false unless valid_youtube_video_id?(formatted_id)
    
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = ENV['YOUTUBE_API_KEY']
    begin
      video = youtube.list_videos('snippet', id: formatted_id).items.first
      video.present?
    rescue Google::Apis::ClientError => e
      errors.add(:video_id, 'does not exist on YouTube') if e.message.include?('Video not found')
    end
  end
  
  private

  def valid_youtube_video_id?(id)
    return id =~ /^[a-zA-Z0-9_-]{11}$/
  end  
end
