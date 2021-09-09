class FriendRequest < ApplicationRecord
    belongs_to :requestor, class_name: :User
    belongs_to :receiver, class_name: :User

    validates :requestor_id, presence: true
    validates :receiver_id, presence: true
    validate :already_friends?
    validate :already_requested?
    validate :adding_self?

    def already_friends?
        if Friendship.find_friendship(self.requestor_id, self.receiver_id)
            self.errors.add(:requestor_id, "You're already friends with this person!")
        end
    end

    def adding_self?
        if self.requestor_id == self.receiver_id
            self.errors.add(:requestor_id, "You can't add yourself as a friend.")
        end
    end

    def already_requested?
        if FriendRequest.find_request(self.requestor_id, self.receiver_id)
            self.errors.add(:requestor_id, "You've already sent a request.")
        end
    end

    def self.find_request(requestor_id, receiver_id)
        FriendRequest.find_by(requestor_id: requestor_id, receiver_id: receiver_id)||FriendRequest.find_by(requestor_id: receiver_id, receiver_id: requestor_id)
    end
    
end
