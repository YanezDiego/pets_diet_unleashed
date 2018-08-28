class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :species

  belongs_to :user
end
