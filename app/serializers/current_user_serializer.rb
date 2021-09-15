class CurrentUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :email, :birthday

  has_many :habits, each_serializer: HabitSerializer
  has_one :profile, serializer: ProfileSerializer
  
end
