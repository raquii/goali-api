class UsersController < ApplicationController
    skip_before_action :authorize, only: :create

    def index
        users = User.all
        users = users.filter_by_name(params[:name]) if params[:name].present?
        users = users.filter_by_username(params[:username]) if params[:username].present?
        render json: users
    end
    
    def create
        @current_user = User.create!(user_params)
        if @current_user.valid?
            create_profile
            session[:user_id] = @current_user.id
            render json: @current_user, status: :created
        end
    end

    def show
        render json: @current_user
    end

    private

    def user_params
        params.permit(:name, :username, :password, :password_confirmation, :email, :birthday)
    end

    def create_profile
        Profile.create(user_id: @current_user.id)
    end
end
