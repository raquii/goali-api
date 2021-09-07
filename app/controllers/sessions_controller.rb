class SessionsController < ApplicationController
    skip_before_action :authorize, only: :create

    def create
        @current_user=User.find_by(username:params[:username])
        
        if @current_user&.authenticate(params[:password])
            session[:user_id] = @current_user.id
            render json: @current_user
          else
            render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end
    
end
