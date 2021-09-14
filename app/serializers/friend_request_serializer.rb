class FriendRequestSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :requestor, serializer: UserSerializer
end
