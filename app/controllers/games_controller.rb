class GamesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create show update forfeit destroy]
  helper_method :game

    def index
      @available_games = Game.available
    end

    def new
      @game = Game.new
    end

    def create
      @game = Game.create(game_params)
      @game.populate_board!
      redirect_to games_path(@game)
    end

    def show
      @game = Game.find(params[:id])
      @white_player = @game.white_player.name
      @black_player = @game.black_player.name unless @game.black_player.nil?

    end

    def update
      
    end 

    private 

    def game_params
    params.require(:game).permit(:white_player_id, :black_player_id)
  end
end
