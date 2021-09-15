class ProfileSerializer < ActiveModel::Serializer
    attributes :id, :bio, :location
end