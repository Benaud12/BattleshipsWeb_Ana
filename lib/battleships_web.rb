require 'sinatra/base'
require_relative 'board'
require_relative 'cell'
require_relative 'water'

class BattleshipsWeb_Ana < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }

  enable :sessions

  get '/' do
    erb :index
  end

  get '/new_game' do
    @name = session[:name]
    session[:board] = Board.new(Cell)
    @board = session[:board].grid
    erb :new_game
  end

  post '/new_game' do
    session[:name] = params[:player]
    redirect to('/new_game')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
