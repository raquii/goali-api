class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :profile

  def profile
    {location: self.object.profile.location,
      profile_picture: self.object.profile.profile_picture,
      bio: self.object.profile.bio}
  end
  
end
