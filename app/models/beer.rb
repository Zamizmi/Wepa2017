class Beer < ActiveRecord::Base
	include AverageRating

	validates :name, presence: true,
									length: {minimum: 3}
	validates :style, presence: true

	belongs_to :brewery
	has_many :ratings, dependent: :destroy
	has_many :raters, -> { uniq }, through: :ratings, source: :user
	def to_s
		"#{name}: #{brewery.name}"
	end

end
