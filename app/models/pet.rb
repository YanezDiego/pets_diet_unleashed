class Pet < ApplicationRecord
  belongs_to :user

  validates_precence_of :name, message: 'Give your pet a name...'
  validates_precence_of :species, message: "Please specify species to help you better"
end
