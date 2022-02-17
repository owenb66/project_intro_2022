class Game < ApplicationRecord
  belongs_to :platform
  belongs_to :publisher
  has_many :game_genres
  has_many :genres, through: :game_genres

  validates :name, :year, :rank, :NA_sales, :EU_sales, :JP_sales, :other_sales, :Global_sales,
            presence: true
  #   validates :name, uniqueness: true
  validates :rank, numericality: { only_integer: true }
  validates :NA_sales, :EU_sales, :JP_sales, :other_sales, :Global_sales, numericality: true

  paginates_per 5
end
