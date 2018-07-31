class Food < ApplicationRecord
  has_many :diets
  has_many :pets, through: :diets

  validates_presence_of :brand

  def self.dog_food
    where(species: 'dog')
  end


  def self.cat_food
    where(species: 'cat')
  end



end
