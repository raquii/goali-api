class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :not_friends

  has_one :profile, serializer: ProfileSerializer

  def not_friends
    true
  end
  
end
