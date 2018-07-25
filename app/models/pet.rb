class Pet < ApplicationRecord
  belongs_to :user

  has_many :diets
  has_many :foods, through: :diets

  validates_presence_of :name, message: 'Give your pet a name...'
  validates_presence_of :species, message: "Please specify species to help you better"


  def self.dog_count
    where(species: 'dog').count
  end

  def self.cat_count
    where(species: 'cat').count
  end

end
