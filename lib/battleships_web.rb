require 'sinatra/base'

class BattleshipsWeb_Ana < Sinatra::Base
  get '/' do
    'Hello BattleshipsWeb_Ana!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
