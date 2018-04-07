class Pawn < ApplicationRecord
  validates :name, presence: true, length: { maximum: 140, minimum: 3 }
end
