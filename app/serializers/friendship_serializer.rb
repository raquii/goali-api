class FriendshipSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :friend, serializer: FriendSerializer
end
