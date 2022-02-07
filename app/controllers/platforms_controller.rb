class PlatformsController < ApplicationController
  def index
    @platforms = Platform.ordered_by_games
    # @platforms = Platform.select("platforms.*")
    #                                   .select("COUNT(platforms.id) as game_count")
    #                                   .left_joins(:games)
    #                                   .group("platforms.id")
    #                                   .order("game_count DESC")
  end

  def show
    @platform = Platform.find(params[:id])
  end
end
