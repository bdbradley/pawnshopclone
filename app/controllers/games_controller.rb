class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]

    def index
      @available_games = Game.where(black_player_id: nil).where.not(white_player_id: current_user)
    end

    def new
      @game = Game.new
    end

    def create
      @game = Game.create(game_params)
      @game.populate_board!
      redirect_to game_path(@game)
    end

    def show
      @game = Game.find(params[:id])
      gon.user_white_name = @game.white_player.name
      gon.user_black_name = @game.black_player.name unless @game.user_black.nil?
    end

    private 

    def game_params
    params.require(:game).permit(:white_user_id, :black_user_id)
  end
end
