class CurrentUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :email, :birthday, :profile

  has_many :habits, each_serializer: HabitSerializer

  def profile
    {location: self.object.profile.location,
      profile_picture: self.object.profile.profile_picture,
      bio: self.object.profile.bio}
  end
  
end
