class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :species
  belongs_to :user, serializer: PetAuthorSerializer
  has_many :diets
end
