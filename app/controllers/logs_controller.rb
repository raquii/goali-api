class LogsController < ApplicationController

    def create
        habit = Habit.find(params[:habit_id])
        log = habit.logs.create!(log_params)
        render json: habit, status: :created
    end

    def update
        log = find_log
        log.update!(log_params)
        render json: log
    end

    def destroy
        log = find_log
        habit = Habit.find(log.habit_id)
        log.destroy
        render json: habit
    end
    
    private

    def log_params
        params.permit(:date)
    end

    def find_log
        log = Log.find(params[:id])
    end
    
end
