require 'sinatra/base'

class Battleshipsweb1 < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/game' do
    @name = params[:title]
    erb :game
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
