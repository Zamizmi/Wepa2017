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
  def favorite_beer
    return nil if ratings.empty?
    ratings.order(score: :desc).limit(1).first.beer
  end

  def favorite_style
    return nil if ratings.empty?
    calculate_style_scores
  end

  def style_ratings_average_per_style(style)
    style_counter = self.ratings.select { |r| r.beer.style == style }
    i = style_counter.map { |r| r.score }.inject(:+) / style_counter.count.to_f
  end

  # Kaipaa refaktorointia, mutta toimii
  def calculate_style_scores
    favorite =""
    i = 0
    self.ratings.map { |r| r.beer.style }.each do |x|
      if style_ratings_average_per_style(x) > i
        i = style_ratings_average_per_style(x)
        favorite = x
      end
    end
    return favorite
  end

  def favorite_brewery
    return nil if ratings.empty?
    calculate_brew_scores
  end

  def brewery_ratings_average_per_brewery(brewery)
    brew_counter = self.ratings.select { |r| r.beer.brewery == brewery }
    i = brew_counter.map { |r| r.score }.inject(:+) / brew_counter.count.to_f
  end

  def calculate_brew_scores
    favorite =""
    i = 0
    self.ratings.map { |r| r.beer.brewery }.each do |x|
      if brewery_ratings_average_per_brewery(x) > i
        i = brewery_ratings_average_per_brewery(x)
        favorite = x
      end
    end
    return favorite
  end
end
