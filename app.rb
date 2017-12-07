require 'sinatra'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions


  get '/' do
    erb :name_form
  end

  post '/names' do
  	$game = Game.new(params[:p1], params[:p2])
  	redirect '/battle'
  end

  get '/battle' do
	@p1_name = $game.player(1).name
	@p2_name = $game.player(2).name
	@attack = params[:attack]
 	#$game.attack($game.player1, $game.player2) if @attack
 	case @attack
    when "Attack Player 1!"
      $game.fight($game.player(1))
    when "Attack Player 2!"
      $game.fight($game.player(2))
  end
	@p1health = $game.player(1).health
  @p2health = $game.player(2).health
  	erb :battle
  end

run!  if app_file == $0
end
