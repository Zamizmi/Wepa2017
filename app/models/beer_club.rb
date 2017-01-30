class BeerClub < ActiveRecord::Base
  include AverageRating

  validates :name, uniqueness: true,
                        length: {minimum: 3, maximum: 30}
  validates :year, numericality: { greater_than_or_equal_to: 1042,
                                  only_integer: true}
  validate :year_date_cannot_be_in_the_future

  has_many :ratings
  has_many :users, through: :ratings

  def year_date_cannot_be_in_the_future
    if self.founded > Date.today.year
      errors.add(:founded, "Can not be established in the future")
    end
  end
end
