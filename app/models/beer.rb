class Beer < ActiveRecord::Base
	include AverageRating

	validates :name, uniqueness: true,
									length: {minimum: 3}

	belongs_to :brewery
	has_many :ratings, dependent: :destroy

	def to_s
		"#{name}: #{brewery.name}"
	end

end
