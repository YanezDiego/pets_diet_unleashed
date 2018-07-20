class Diet < ApplicationRecord
  belongs_to :pet
  belongs_to :food

  validates_presence_of :name
end
