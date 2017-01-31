module AverageRating
  extend ActiveSupport::Concern
  def AverageRating
    if self.ratings.count >0
    (self.ratings.map {|n| n.score}.sum.to_f/self.ratings.count).round(2)
  else
    "Not yet rated"
  end
  end
end
