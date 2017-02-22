module AverageRating
  extend ActiveSupport::Concern
  def AverageRating
    if self.ratings.count >0
    (self.ratings.map {|n| n.score}.sum.to_f/self.ratings.count).round(1)
  else
    0
  end
  end
end
