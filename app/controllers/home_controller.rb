class HomeController < ApplicationController
  def index
    @games = Game.includes(:publisher, :platform).order("rank ASC").limit(10)
    @publishers = Publisher.ordered_by_games.limit(10)
    @platforms = Platform.ordered_by_games.limit(10)
  end
end
