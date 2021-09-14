class FriendshipsController < ApplicationController

    def index
        friends = @current_user.friendships
        render json: friends
    end

    def create
        friendship = Friendship.create_reciprocal_for_ids(@current_user.id, params[:friend_id])
        
        if friendship.valid?
            request = FriendRequest.find_request(friendship.user_id, friendship.friend_id)
            request.destroy
            render json: friendship, status: :created
        end
    end

    def destroy
        Friendship.destroy_reciprocal_for_ids(@current_user.id, params[:friend_id])
        render json: {message: "Friend removed"}
    end   

    private

    def friendship_params
        params.permit(:user_id, :friend_id)
    end
end
