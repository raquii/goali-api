class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :email, :birthday, :profile

  has_many :habits

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
      total_times: habit.count_times_logged,
      logs: habit.get_logs
      }
    end
  end
end
