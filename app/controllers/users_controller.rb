class UsersController < ApplicationController
    skip_before_action :authorize, only: :create

    def index
        users = User.all
        users = users.filter_by_query(params[:search]) if params[:search].present?
        render json: users
    end
    
    def create
        @current_user = User.create!(user_params)
        if @current_user.valid?
            create_profile
            session[:user_id] = @current_user.id
            render json: @current_user, status: :created, serializer: CurrentUserSerializer
        end
    end

    def show
        render json: @current_user, serializer: CurrentUserSerializer
    end

    private

    def user_params
        params.permit(:name, :username, :password, :password_confirmation, :email, :birthday)
    end

    def create_profile
        Profile.create(user_id: @current_user.id)
    end
end
