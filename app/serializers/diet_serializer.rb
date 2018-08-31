class DietSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :food
  belongs_to :pet
end
