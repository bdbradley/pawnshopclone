class Game < ApplicationRecord
  belongs_to :white_player, :class_name => 'User'
  belongs_to :black_player, :class_name => 'User'
  belongs_to :user
  has_many :pieces

 

   

end