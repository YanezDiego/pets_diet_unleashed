class Food < ApplicationRecord
  has_many :diets
  has_many :pets, through: :diets

  validates_presence_of :brand
end
