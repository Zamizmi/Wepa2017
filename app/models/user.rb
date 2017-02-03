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

end
