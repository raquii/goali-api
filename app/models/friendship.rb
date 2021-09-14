class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, class_name: :User

    validates :user_id, presence: true
    validates :friend_id, presence: true
    validate :request_exists?

    def request_exists?
       if !FriendRequest.find_request(self.user_id, self.friend_id)
        self.errors.add("Request must exist first")
       end
    end
        
    def self.create_reciprocal_for_ids(user_id, friend_id)
        user_friendship = Friendship.create(user_id: user_id, friend_id: friend_id)
        friend_friendship = Friendship.create(user_id: friend_id, friend_id: user_id)
        user_friendship
    end

    def self.destroy_reciprocal_for_ids(user_id, friend_id)
        friendship1 = Friendship.find_by(user_id: user_id, friend_id: friend_id)
        friendship2 = Friendship.find_by(user_id: friend_id, friend_id: user_id)
        friendship1.destroy
        friendship2.destroy
    end
end
