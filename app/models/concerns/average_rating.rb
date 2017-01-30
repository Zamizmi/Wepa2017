module AverageRating
  extend ActiveSupport::Concern
  def AverageRating
    (self.ratings.map {|n| n.score}.sum.to_f/self.ratings.count).round(2)
  end
end
