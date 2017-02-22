class Beer < ActiveRecord::Base
	include AverageRating

	validates :name, presence: true,
									length: {minimum: 3}
  validates :style_id, presence: true

	belongs_to :brewery
	belongs_to :style
	has_many :ratings, dependent: :destroy
	has_many :raters, -> { uniq }, through: :ratings, source: :user
	def to_s
		"#{name}: #{brewery.name}"
	end

	def self.top(n)
		sorted_by_rating_in_desc_order = Beer.all.sort_by{ |b| -(b.AverageRating||0) }
		sorted_by_rating_in_desc_order.first(n)
	end

end
