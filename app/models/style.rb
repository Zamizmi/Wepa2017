class Style < ActiveRecord::Base
  include AverageRating

  has_many :beers
  has_many :ratings, through: :beers

  def self.top(n)
    sorted_by_rating_in_desc_order = Style.all.sort_by{ |s| -(s.AverageRating||0) }
    sorted_by_rating_in_desc_order.first(n)
  end

  def styles_ratings
    self.ratings.count
  end

end
