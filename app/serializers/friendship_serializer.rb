class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :profile, :habits, :friendship_id

  # def profile
  #   {location: self.object.profile.location,
  #     profile_picture: self.object.profile.profile_picture,
  #     bio: self.object.profile.bio}
  # end

  # def habits
  #   self.object.habits.map do |habit|
  #     if habit.private == false && habit.archived == false
  #       {id: habit.id,
  #       name: habit.name,
  #       description: habit.description,
  #       periodicity: habit.periodicity,
  #       frequency: habit.goal,
  #       total_times: habit.count_times_logged,
  #       logs: habit.get_logs
  #       }
  #     end
  #   end
  # end
end
