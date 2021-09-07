class User < ApplicationRecord
    has_secure_password

    scope :filter_by_name, -> (name){ where("name like ?", "#{name}%")}
    scope :filter_by_username, -> (username){ where("username like ?", "#{username}%")}

    #relationship macros
    has_one :profile, dependent: :destroy

    has_many :habits, dependent: :destroy

    has_many :friendships_as_friend_a, foreign_key: :friend_a_id, class_name: :Friendship, dependent: :destroy
    has_many :friendships_as_friend_b, foreign_key: :friend_b_id, class_name: :Friendship, dependent: :destroy

    has_many :friend_requests_as_requestor, foreign_key: :requestor_id, class_name: :FriendRequest, dependent: :destroy
    has_many :friend_requests_as_receiver, foreign_key: :receiver_id, class_name: :FriendRequest, dependent: :destroy

    #validations
    validates :name, presence: true
    validates :email, presence: true
    validates :username, presence: true, length: {in: 5..30}, uniqueness: {message: "%{value} is already taken!"}, format: {with: /\A[a-zA-Z\d_]+\z/, message: "letters, numbers, and underscores only."}
    validates :password, presence: true, format:{ with: %r{\A.*(?=.{7,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=]).*\z}}, confirmation: true 
    validates_date :birthday, on_or_before: lambda { 13.years.ago }, before_message: "must be at least 13 years old"

   def friends
        self.friendships_as_friend_a + self.friendships_as_friend_b
   end
end
