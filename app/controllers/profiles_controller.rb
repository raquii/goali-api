class ProfilesController < ApplicationController
    before_action :authorize_editor, only: :update

    def show
        profile = Profile.find_by(profile_params)
        render json: profile
    end 

    def update
        profile = Profile.find(params[:id])
        profile.update!(profile_params)
        render json: profile
    end

    private

    def profile_params
        params.permit(:location, :profile_picture, :bio)
    end
    
end
