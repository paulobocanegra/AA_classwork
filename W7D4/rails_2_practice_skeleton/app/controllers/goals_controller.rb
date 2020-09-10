class GoalsController < ApplicationController

    before_action :require_log_in, only: [:create, :destroy]

    def create
        @goal = Goal.new(goal_params)
        @goal.user_id = params[:user_id]
        # debugger
        if @goal.save
            redirect_to user_url(@goal.user_id)
        else 
            flash[:errors] = @goal.errors.full_messages   
            redirect_to user_url(@goal.user_id)
        end
    end

    def destroy
        @goal = current_user.goals.find_by(id: params[:id])
        if @goal
            @goal.destroy
            redirect_to users_url
        end
    end

    private
    def goal_params
        params.require(:goal).permit(:name, :details, :status, :user_id)
    end
end

