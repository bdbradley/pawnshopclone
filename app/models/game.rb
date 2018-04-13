class Game < ApplicationRecord
  belongs_to :white_player, :class_name => 'User'
  belongs_to :black_player, :class_name => 'User'
  belongs_to :user
  has_many :pieces


  def self.create_game(params)
		game = Game.create(params)
		game.set_board
		game
	end

	def set_board
    [*0..7].each do |position|
      Pawn.create(
        game_id: id,
        x_position: position,
        y_position: 1,
        user_id: black_id
        )
    end



    [*0..7].each do |position|
      Pawn.create(
        game_id: id,
        x_position: position,
        y_position: 6,
        user_id: white_id
        )
    end

	def full?
		white_id != nil && black_id != nil
	end

	def self.find_by_position(x, y, game_id)
		Piece.where(x_position: x, y_position: y, game_id: game_id).first
	end

	def piece_at(x, y)
		Piece.where(game_id: self.id, row_position: x, col_position: y).at?
	end

	def full?
		white_id != nil && black_id != nil
	end

end
end


