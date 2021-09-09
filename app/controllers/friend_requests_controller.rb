class FriendRequestsController < ApplicationController
   
    def index
        requests = @current_user.get_requests
        render json: requests, each_serializer: FriendRequestSerializer 
    end

    def create
        request = FriendRequest.create!(friend_request_params)
        render json: request, status: :created
    end

    def destroy
        request = FriendRequest.find_by(friend_request_params)
        request.destroy
        render json: {message: "Friend request deleted"}
    end

    private
    
    def friend_request_params
        params.permit(:requestor_id, :receiver_id)
    end

end
