class PiecesController < ApplicationController
	
	def show
    @piece = Piece.find(params[:id])
    @game = @piece.game
  end
  #Comment belongs to User.  User has many comments.  
  #comment.find_by(user)

  def update
  	@piece = Piece.find(params[:id])
  	@game = @piece.game
  	#update attributes 
  	redirect_to game_path
	end 

	

end


