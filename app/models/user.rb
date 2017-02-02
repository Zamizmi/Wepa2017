class User < ActiveRecord::Base
  include AverageRating

  has_secure_password

  validates :username, uniqueness: true,
                        length: {minimum: 3, maximum: 30}
  validates :password, length: {minimum: 4}
  validates :password, :format => {:with => /\A(?=.*[a-zA-Z])(?=.*[0-9]).{4,}\z/}

  has_many :memberships, dependent: :destroy
  has_many :beer_clubs, -> { uniq }, through: :memberships

  has_many :ratings,  dependent: :destroy
  has_many :beers, through: :ratings

end
