require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/destroyer'
require_relative './lib/submarine'

class Battleshipsweb1 < Sinatra::Base

  enable :sessions
  @@turn = 0
  PLAYER1 = Player.new
  PLAYER2 = Player.new

  get '/' do
    erb :index
  end

  get '/game' do
    @name = session[:title]
    if session[:player] == 1
      @hits = PLAYER1.hits.length
      @misses = PLAYER1.misses.length
    else
      @hits = PLAYER2.hits.length
      @misses = PLAYER2.misses.length
    end
    erb :game
  end

  post '/game' do
    if @@turn == 0
      @name = params[:title]
      session[:title] = @name
      session[:player] = 1
      # session[:opponent] = PLAYER2
      @@turn += 1
    else
      @name = params[:title]
      session[:title] = @name
      session[:player] = 2
      # session[:opponent] = PLAYER1
    end
    if session[:player] == 1
      @hits = PLAYER1.hits.length
      @misses = PLAYER1.misses.length
    else
      @hits = PLAYER2.hits.length
      @misses = PLAYER2.misses.length
    end
    puts session.inspect
    erb :game
  end

  post '/fire' do
    if session[:player] == 1
      PLAYER2.receive_hit(params[:coord_input])
    else
      PLAYER1.receive_hit(params[:coord_input])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
