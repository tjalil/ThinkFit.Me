class GoalsController < ApplicationController
  def new
    @goal = Goal.new
  end

  def create

    @goal = Goal.new(goal_params)

    @goal.user_id = current_user.id
    if @goal.save
      redirect_to user_path(current_user.id)  # change to dashboard change
    else
      render 'new'

    end
  end 

  def show
  end

  private 
  def goal_params
   params.require(:goal).permit(:weekly_goal, :user_id, :activity_id)
  end
end
