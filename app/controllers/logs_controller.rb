class LogsController < ApplicationController

    def create
        habit = Habit.find(id: params[:habit_id])
        log = habit.logs.create!(log_params)
        render json: habit, status: :created
    end

    def destroy
        log = find_log
        log.destroy
        head :no_content
    end
    
    private

    def log_params
        params.permit(:date)
    end

    def find_log
        log = Log.find(params[:id])
    end
    
end
