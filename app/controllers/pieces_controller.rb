class PiecesController < ApplicationController


  def show
    @piece = Piece.find(params[:id])
    @game = @piece.game
  end
  # Comment belongs to User.  User has many comments.
  # comment.find_by(user)

  def update
    @piece = Piece.find(params[:id])
    @game = @piece.game
    @piece.move_to!(x_position: params[:new_x], y_position: params[:new_y])
    @game.update(white_player_turn: !@game.white_player_turn)
    redirect_to game_path(@game)
  end

  private

  def piece_params
    params.require(:piece).permit(:x_position, :y_position)
  end
end
