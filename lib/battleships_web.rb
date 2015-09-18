require 'sinatra/base'
require_relative 'board'
require_relative 'cell'
require_relative 'water'
require_relative 'ship'

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
    create_session_fleet
    redirect '/display_board'
  end

  get '/display_board' do
    @name = session[:name]
    @board = $board
    @fleet = session[:fleet]
    erb :display_board
  end

  post '/display_board' do
    ship = Ship.send(params[:type].to_sym)
    $board.place(ship, params[:position].to_sym, params[:orientation].to_sym)
    session[:fleet].delete_if{ |item| item[0] == params[:type].to_sym}
    redirect '/display_board'
  end

  def create_session_fleet
    session[:fleet] = [ [:aircraft_carrier, 'Aircraft Carrier (5)'],
                        [:battleship, 'Battleship (4)'],
                        [:destroyer, 'Destroyer (3)'],
                        [:submarine, 'Submarine (3)'],
                        [:patrol_boat, 'Patrol Boat (2)']]
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
