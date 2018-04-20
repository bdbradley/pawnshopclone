class User < ApplicationRecord
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :games, inverse_of: 'user', dependent: :destroy, foreign_key: :white_player_id

  validates :name, presence: true

  


end
