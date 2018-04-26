class PiecesController < ApplicationController
	
	def show
    @piece = Piece.find(params[:id])
    @game = @piece.game
  end
  #Comment belongs to User.  User has many comments.  
  #comment.find_by(user)

  

  def update
  	piece_to_move = Piece.find(params[:id])
    @game = piece_to_move.game
    piece_to_move.move_piece!
    redirect_to game_path(@game)
  	
  	
  	
	end 

	

end


