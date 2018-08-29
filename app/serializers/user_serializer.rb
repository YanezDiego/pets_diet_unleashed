class UserSerializer < ActiveModel::Serializer
  attributes :id, :username

  has_many :pets, serializer: PetSerializer
end
