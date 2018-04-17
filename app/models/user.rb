class User < ApplicationRecord
  has_many :created_games, :class_name => 'Game', foreign_key: "white_player"
  has_many :joined_games, :class_name => 'Game',  foreign_key: "black_player"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
