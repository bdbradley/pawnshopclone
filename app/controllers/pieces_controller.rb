class PiecesController < ApplicationController
	
	def show
    @piece = Piece.find(params[:id])
    @game = Game.find(params[:id]) 
  end

  def update
  	@game = Game.find(params[:id])
  	@game.update.move_piece
  	redirect_to game_path
	end 

	def get_piece_at_coor(x_pos, y_pos)
    pieces.find_by(x_position: x_pos, y_position: y_pos)
  end

  def move_piece(new_x, new_y)
    piece_to_move = game.get_piece_at_coor
    update(x_position: new_x, y_position: new_y)
  end

end


