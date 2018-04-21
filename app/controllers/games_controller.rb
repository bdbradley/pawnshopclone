class GamesController < ApplicationController
  before_action :authenticate_user!
  

  def index
    @available_games = Game.available
  end

  def new
    @game = Game.new
  end

  def create
  
    white_player_id = current_user.id
    @game = Game.create(white_player_id: current_user.id)
    @game.populate_board!
    redirect_to games_path
  end

  def show
    @game = Game.find(params[:id])
    @black_player = User.find_by(id: @game.black_player_id)
    @white_player = User.find_by(id: @game.white_player_id)

  end

  def update
    @game = Game.find(params[:id])
    @game.update_attributes(black_player_id: current_user.id)
    redirect_to game_path(@game)
    
  end 

  private 

  def game_params
    params.require(:game).permit(:white_player_id, :black_player_id)
  end
end
