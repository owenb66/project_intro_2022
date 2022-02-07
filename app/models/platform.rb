class Platform < ApplicationRecord
  has_many :games
  validates :name, uniqueness: true

  def self.ordered_by_games
    self.select("platforms.*")
        .select("COUNT(platforms.id) as game_count")
        .left_joins(:games)
        .group("platforms.id")
        .order("game_count DESC")
  end
end
