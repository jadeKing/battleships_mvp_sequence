require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/destroyer'
require_relative './lib/submarine'

class Battleshipsweb1 < Sinatra::Base

  enable :sessions

  PLAYER = Player.new

  get '/' do
    erb :index
  end

  get '/game' do
    @name = session[:title]
    @hits = PLAYER.hits.length
    @misses = PLAYER.misses.length
    erb :game
  end

  post '/game' do
    @name = params[:title]
    session[:title] = @name
    @hits = PLAYER.hits.length
    @misses = PLAYER.misses.length
    puts session.inspect
    erb :game
  end

  post '/fire' do
    PLAYER.receive_hit(params[:coord_input])
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
