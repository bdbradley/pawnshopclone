class Piece < ApplicationRecord
  belongs_to :user
	belongs_to :game

	def color
	end

	def color_check
		color ? 'white_id' : 'black_id'
	end

	def executable_move?(x_target, y_target)
		return false unless valid_move?(x_target, y_target)
		return false unless on_board?(x_target, y_target)
		return false if obstacle_between?(x_target, y_target)
		return false if no_move?(x_target, y_target)
		return true
	end

	def no_move?(x_target, y_target)
		(x_position == x_target) && (y_position == y_target)
	end

	def obstacle_between?(x_target, y_target)
		obstacle_list = []
		Piece.all.each do |piece|
			obstacle_list.append([piece.x_position, piece.y_position])
		end

		if ((x_position - x_target).abs == (y_position - y_target).abs)
			return false unless (diagonal_path(x_target, y_target) & obstacle_list).empty?
		else
			return false unless (rectilinear_path(x_target, y_target) & obstacle_list).empty? #
		end
	end

	def on_board?(x_target, y_target)
		(0 <= x_target && x_target <= 7) && (0 <= y_target && y_target <= 7)
	end

	def self.find_by_position(x, y, game_id)
		Piece.where(x_position: x, y_position: y, game_id: game_id).first
	end

	def diagonal_path(x_target, y_target)

		current_x_position = self.x_position

		current_y_position = self.y_position

		if x_target > current_x_position
			x_increment = 1
		else
			x_increment = -1
		end

		if y_target > current_y_position
			y_increment = 1
		else
			y_increment = -1
		end

		current_x_position += x_increment
		current_y_position += y_increment


		diagonal_collection  = []


		until (current_x_position -  x_target).abs == 0 && (current_y_position - y_target) == 0
			diagonal_collection << [current_x_position, current_y_position]
			current_x_position += x_increment
			current_y_position += y_increment
		end

		return diagonal_collection

	end


def rectilinear_path(x_target, y_target)

	current_x_position = self.x_position

	current_y_position = self.y_position



	rectilinear_collection = Array.new()


	if current_y_position == y_target

        if x_target > current_x_position
			x_increment = 1
		else
			x_increment = -1
	end

		current_x_position += x_increment

      	until (current_x_position - x_target).abs == 0
        	rectilinear_collection << [current_x_position, current_y_position]
        	current_x_position += x_increment
      	end

  	elsif current_x_position == x_target

        if y_target > current_y_position
			y_increment = 1
		else
			y_increment = -1
	end

		current_y_position += y_increment

      	until (current_y_position - y_target).abs == 0
        	rectilinear_collection << [current_x_position, current_y_position]
        	current_y_position += y_increment
      	end
  	end

    return rectilinear_collection

end

end
