class Blogger < ApplicationRecord

  has_many :posts
  has_many :destinations, through: :posts

  validates :name, presence: true, uniqueness: true
  validates :bio, length: {minimum: 30}
  validates :age, numericality: {minimum: 1}

end
