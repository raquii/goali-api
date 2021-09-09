class Friendship < ApplicationRecord
    belongs_to :friend_a, class_name: :User
    belongs_to :friend_b, class_name: :User

    validates :friend_a_id, presence: true
    validates :friend_b_id, presence: true
    validate :request_exists?

    def request_exists?
       if !FriendRequest.find_request(self.friend_a_id, self.friend_b_id)
        self.errors.add("Request must exist first")
       end
    end
        
    def self.find_friendship(friend_a_id, friend_b_id)
        Friendship.find_by(friend_a_id: friend_a_id, friend_b_id: friend_b_id) || Friendship.find_by(friend_a_id: friend_b_id, friend_b_id: friend_a_id)
    end
end
