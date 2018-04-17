class Game < ApplicationRecord
  belongs_to :white_player_id, class_name: 'User', optional: true
  belongs_to :black_player_id, class_name: 'User', optional: true

  has_many :pieces

  validates :name, :presence => true

end
