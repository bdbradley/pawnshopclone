class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]

    def index
      @games = Game.all
    end

    def new
      @game = Game.new
    end

    def create
      @game = current_user.created_games.create(game_params)
      if @game.persisted?
        flash[:success] = ''
      end
      redirect_to root_path
    end

    def show
      @game = Game.find(params[:id])
    end

    private

    def game_params
      params.require(:game).permit(:name)
    end

  end
