class Pet < ApplicationRecord
  belongs_to :user

  has_many :diets
  has_many :foods, though: :diets

  validates_presence_of :name, message: 'Give your pet a name...'
  validates_presence_of :species, message: "Please specify species to help you better"
end
