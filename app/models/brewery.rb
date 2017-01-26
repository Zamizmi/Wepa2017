class Brewery < ActiveRecord::Base
	include AverageRating

	has_many :beers, dependent: :destroy
	has_many :ratings, through: :beers

	def print_report
		puts name
		puts "established at year #{year}"
		puts "number of beers #{beer.count}"
	end
	#self.ratings.map{|n| n.score}.inject(:+).to_f/self.ratings.count

	def restart
		self.year = 2017
		puts "changed year to #{year}"
	end

	def to_s
		"#{name}, established: #{year}"
  end
end
