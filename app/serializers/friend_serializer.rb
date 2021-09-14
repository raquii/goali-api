class FriendSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :profile, :habits

  def profile
    {location: self.object.profile.location,
      profile_picture: self.object.profile.profile_picture,
      bio: self.object.profile.bio}
  end

  def habits
    self.object.habits.public_active.map do |habit|
        {
        id: habit.id,
        name: habit.name,
        description: habit.description,
        periodicity: habit.periodicity,
        frequency: habit.goal,
        total_times: habit.total_times,
        logs: habit.get_logs
        }
    end
  end
  
end
