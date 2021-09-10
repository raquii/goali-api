class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :email, :birthday, :profile, :habits

  def profile
    {location: self.object.profile.location,
      profile_picture: self.object.profile.profile_picture,
      bio: self.object.profile.bio}
  end

  def habits
    self.object.habits.map do |habit|
      {id: habit.id,
      name: habit.name,
      description: habit.description,
      periodicity: habit.periodicity,
      frequency: habit.goal,
      private_habit: habit.private,
      archived: habit.archived,
      total_times: habit.total_times,
      logs: habit.get_logs
      }
    end
  end
end
