class GamesController < ApplicationController
  def index
    # @games = Game.order("rank ASC") # create an n+1 issue
    @games = Game.includes(:publisher, :platform).all.order("rank ASC")
  end

  def show
    @game = Game.find(params[:id])
  end
end
