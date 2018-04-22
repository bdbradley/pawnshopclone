class GamesController < ApplicationController
  before_action :authenticate_user!
  

  def index
    @available_games = Game.available
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    @game.update_attributes(:white_player => current_user)
    @game.populate_board!
    redirect_to games_path
    
    
  end

  def show
    @game = Game.find(params[:id])
    white_player_name = @game.white_player.name
    black_player_name = @game.black_player.name 
    

  end

  def update
    @game = Game.find(params[:id])
    @game.update_attributes(game_params)
    flash[:notice] = "You successfully joined the game!"
    redirect_to game_path(@game)
    
  end 

  private 

  def game_params
      params.require(:game).permit(:name, :white_player, :black_player)
  end

  end
