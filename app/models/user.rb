class User < ActiveRecord::Base
  include AverageRating

  has_secure_password

  validates :username, uniqueness: true,
  length: {minimum: 3, maximum: 30}
  validates :password, length: {minimum: 4}
  validates :password, format: { with: /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{4,}/, message:"Error occurred with creating new user! Username needs to be four characters long!
  Password and password confirmation needs to be identical and minimum of 4 characters long containing at least one number [0-9] and one capital letter [A-Z]!"}

  has_many :memberships, dependent: :destroy
  has_many :beer_clubs, -> { uniq }, through: :memberships

  has_many :ratings,  dependent: :destroy
  has_many :beers, through: :ratings

  def rating_of(category, item)
    ratings_of = ratings.select{ |r| r.beer.send(category)==item }
    ratings_of.map(&:score).inject(&:+) / ratings_of.count.to_f
  end

  def favorite_beer
    favorite :beer
  end

  def favorite_style
    favorite :style
  end

  def favorite_brewery
    favorite :brewery
  end

  def favorite(category)
    return nil if ratings.empty?

    rated = ratings.map{ |r| r.beer.send(category) }.uniq
    rated.sort_by { |item| -rating_of(category, item) }.first
  end

  def self.top(n)
    sorted_by_rating_in_desc_order = User.all.sort_by{ |b| -(b.ratings.count||0) }
    sorted_by_rating_in_desc_order.first(n)
  end
end
