require 'sinatra/base'
require_relative 'board'
require_relative 'cell'
require_relative 'water'

class BattleshipsWeb_Ana < Sinatra::Base

  $board = Board.new(Cell)

  set :views, proc { File.join(root, '..', 'views') }

  enable :sessions

  get '/' do
    erb :index
  end

  post '/new_game' do
    redirect '/' if params[:player].to_s == ''
    session[:name] ||= params[:player]
    redirect '/display_board'
  end

  get '/display_board' do
    @name = session[:name]
    @board = $board
    erb :display_board
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
