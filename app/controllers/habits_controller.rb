class HabitsController < ApplicationController

    def index
        habits = @current_user.habits
        render json: habits, methods: [:total_times]
    end

    def show
        habit = Habit.find(find_habit)
        render json: habit, include: :logs
    end

    def create
        habit = @current_user.habits.create!(habit_params)
        render json: habit, status: :created
    end

    def update
        habit = find_habit
        habit.update!(habit_params)
        render json: habit
    end

    def destroy
        habit = find_habit
        if habit.user_id == @current_user.id
            habit.destroy
            render json: {message: "Successfully deleted."}
        end
    end

    private

    def habit_params
        params.permit(:id, :name, :description, :icon, :periodicity, :goal, :private, :archived)
    end

    def find_habit
        Habit.find(params[:id])
    end
end
