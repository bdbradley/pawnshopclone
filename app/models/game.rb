class Game < ApplicationRecord
  belongs_to :white_player, class_name: 'User', optional: true
  belongs_to :black_player, class_name: 'User', optional: true
  belongs_to :owner, class_name: 'User'
  has_many :pieces

  validates :name, :presence => true

end
