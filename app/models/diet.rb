class Diet < ApplicationRecord
  belongs_to :pet
  belongs_to :diet

  validates_precence_of :name
end
