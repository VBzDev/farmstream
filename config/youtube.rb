require 'google/apis/youtube_v3'
require 'dotenv/load'

# Especifique o escopo da API que será utilizada
SCOPE = Google::Apis::YoutubeV3::AUTH_YOUTUBE_FORCE_SSL

# Configure o cliente da API do YouTube
client = Google::Apis::YoutubeV3::YouTubeService.new

client.key = ENV['YOUTUBE_API_KEY']

# Faça a requisição para listar os vídeos do canal
channel_id = "UC_x5XG1OV2P6uZZ5FSM9Ttw" # insira aqui o ID do canal desejado
videos = client.list_searches('id,snippet', channel_id: channel_id, type: 'video')

# Exiba o título e o link de cada vídeo
videos.items.each do |video|
  puts "Título: #{video.snippet.title}"
  puts "Link: https://www.youtube.com/watch?v=#{video.id.video_id}"
  puts ""
end