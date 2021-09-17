class ProfilesController < ApplicationController
    
    def show
        profile = User.find_by(username:params[:username])
        render json: profile
    end 

    def update
        profile = Profile.find(params[:id])
        if profile.user_id == @current_user.id
            profile.update!(profile_params)
            render json: profile
        end
    end

    private

    def profile_params
        params.permit(:location, :profile_picture, :bio)
    end

    
end
