class HabitSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :periodicity, :frequency, :private_habit, :archived, :total_times, :logs
  
  def frequency
    self.object.goal
  end

  def private_habit
    self.object.private
  end

  def logs
    self.object.get_logs
  end

end
