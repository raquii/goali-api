class FriendshipsController < ApplicationController
    skip_before_action :authorize

    def index
        friends = @current_user.get_friends
        render json: friends
    end

    def create
        friendship = Friendship.create!(friend_a_id: @current_user.id, friend_b_id: params[:friend_b_id])
        
        if friendship.valid?
            request = FriendRequest.find_request(friendship.friend_a_id, friendship.friend_b_id)
            request.destroy
            render json: friendship, status: :created
        end
    end

    def destroy
        friendship = Friendship.find_by(friendship_params)
        friendships.destroy
        head :no_content
    end   

    private

    def friendship_params
        params.permit(:friend_a_id, :friend_b_id)
    end
end
