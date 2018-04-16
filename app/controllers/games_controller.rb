class GamesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :show]


    def index
      @games = Game.available
    end

    def new
      @game = Game.new
    end

    def create
      @game = current_user.games.create(game_params)
      redirect_to game_path(@game)
    end

    def show

      @game = Game.find(params[:id])
      @pieces = @game.pieces
      @black_player = @game.black_user_id
      @white_player = @game.white_user_id

      
 
    end
    

    private
    

 

  end
