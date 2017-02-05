class Brewery < ActiveRecord::Base
	include AverageRating

	validates :name, length: {minimum: 3}
	validates :year, numericality: { greater_than_or_equal_to: 1042,
                                    only_integer: true}
	validate :year_date_cannot_be_in_the_future

	has_many :beers, dependent: :destroy
	has_many :ratings, through: :beers

	def year_date_cannot_be_in_the_future
		if self.year > Date.today.year
			errors.add(:year, "Can not be established in the future")
		end
	end

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
