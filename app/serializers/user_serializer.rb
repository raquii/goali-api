class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :profile

  has_one :profile, serializer: ProfileSerializer
  
end
