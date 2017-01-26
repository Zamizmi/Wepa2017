module AverageRating
  extend ActiveSupport::Concern
  def AverageRating
    self.ratings.map {|n| n.score}.inject(:+).to_f/self.ratings.count
  end
end
