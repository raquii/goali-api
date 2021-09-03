class ApplicationController < ActionController::API
    include ActionController::Cookies

    rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_response_invalid

    before_action :authorize

    private

    def authorize
        @current_user = User.find_by(id: session[:user_id])
        render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user
    end

    def render_response_not_found(execption)
        render json: { errors: "#{exception.model} not found."}, status: :not_found
    end

    def render_response_invalid(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
