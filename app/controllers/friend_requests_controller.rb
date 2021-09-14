class FriendRequestsController < ApplicationController

    def index
        requests = @current_user.friend_requests_as_receiver
        render json: requests, each_serializer: FriendRequestSerializer 
    end

    def create
        request = FriendRequest.create!(@current_user.id, params[:friend_id])
        render json: request, status: :created
    end

    def destroy
        request = find_request
        request.destroy
        render json: {message: "Friend request deleted"}
    end

    private

    def find_request
        FriendRequest.find(params[:id])
    end
    
    def friend_request_params
        params.permit(:requestor_id, :receiver_id)
    end

end
