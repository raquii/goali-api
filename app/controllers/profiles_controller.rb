class ProfilesController < ApplicationController

    def show
        profile = Profile.find_by(profile_params)
        render json: profile
    end 

    def update
        profile = Profile.find(params[:id])
        if profile.user == @current_user
            profile.update!(profile_params)
            render json: profile
        end
    end

    private

    def profile_params
        params.permit(:location, :profile_picture, :bio)
    end

    
end
