class PiecesController < ApplicationController

  def show
    @piece = Piece.find(params[:id])
  end

  def create
    @piece = current_game.pieces.create(piece_params)
  end

  def update
    @piece = Piece.find(params[:id])
    @piece.move_to!(params[:x_position], params[:y_position])
    redirect_to game_path(current_game[:id])
  end

  private 

  def piece_params 
    params.permit(:x_position, :y_position, :type)
  end 

  helper_method :current_game

  def current_game 
    @current_game ||= Game.find(params[:game_id])
  end 

  

  

end 

  
  
    
    






