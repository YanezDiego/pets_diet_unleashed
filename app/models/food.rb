class Food < ApplicationRecord
  has_many :diets
  has_many :pets, through: :diets

  validates_precence_of :brand
end
