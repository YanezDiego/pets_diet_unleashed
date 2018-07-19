class Diet < ApplicationRecord
  belongs_to :pet
  belongs_to :diet

  validates_presence_of :name
end
