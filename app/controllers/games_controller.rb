class GamesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :show]


    def index
      @games = Game.available
    end

    def new
      @game = Game.new
    end

    def create
<<<<<<< HEAD
      @game = current_user.created_games.create(game_params)
      if @game.persisted?
        flash[:success] = ''
      end
      redirect_to root_path
    end

    def show
      @game = Game.find(params[:id])
=======
      @game = current_user.games.create(game_params)
      redirect_to game_path(@game)
    end

    def show

      @game = Game.find(params[:id])
      @pieces = @game.pieces
      @black_player = @game.black_user_id
      @white_player = @game.white_user_id

      
 
>>>>>>> 347b4ac3a05578df7d69eecdefa98d56afc8823d
    end

    private

    def game_params
      params.require(:game).permit(:name)
    end

  end
