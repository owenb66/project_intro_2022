class GamesController < ApplicationController
  def index
    # @games = Game.order("rank ASC") # create an n+1 issue
    @games = Game.includes(:publisher, :platform).all.order("rank ASC").page params[:page]
  end

  def show
    @game = Game.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @games = Game.where("name LIKE ?", wildcard_search)
    # logger.debug "#{wildcard_search}"
  end
end
