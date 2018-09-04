class DietSerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :food
  belongs_to :pet
end
