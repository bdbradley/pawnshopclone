class Piece < ApplicationRecord
  
belongs_to :game

def color
    return 'white' if is_white == true
    'black'
  end

  def render
    "blues-#{color}-#{type.downcase}.png"
  end
