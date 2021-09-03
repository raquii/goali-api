class User < ApplicationRecord
    has_secure_password

    has_one :profile, dependent: :destroy

    has_many :habits, dependent: :destroy

    has_many :friendships_as_friend_a, foreign_key: :friend_a_id, class_name: :Friendship, dependent: :destroy
    has_many :friendships_as_friend_b, foreign_key: :friend_b_id, class_name: :Friendship, dependent: :destroy

    has_many :friend_requests_as_requestor, foreign_key: :requestor_id, class_name: :FriendRequest, dependent: :destroy
    has_many :friend_requests_as_receiver, foreign_key: :receiver_id, class_name: :FriendRequest, dependent: :destroy
end
