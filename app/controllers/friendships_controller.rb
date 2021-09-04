class FriendshipsController < ApplicationController

    def create
        friendship = Friendship.create!(friendship_params)
        if friendships.valid?
            request = FriendRequest.lookup(params[:friendship][:friend_a_id], params[:friendship][:friend_b_id])
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
