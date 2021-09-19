class FriendSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :habits

  has_one :profile, serializer: ProfileSerializer

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
