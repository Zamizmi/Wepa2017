class Beer < ActiveRecord::Base
	belongs_to :brewery
	has_many :ratings

	def average_rating
			self.ratings.map{|n| n.score}.inject(:+).to_f/self.ratings.count
	end

end
