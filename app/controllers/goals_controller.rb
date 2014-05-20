class GoalsController < ApplicationController

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    @goal.status = "active"
    
    if @goal.save
      redirect_to dashboard_user_path(current_user), notice: "Successfully created new activity #{@goal.name_of_activity_through_goal}"
    else
      render :new
    end
  end 

  def show
  end

  private 

  def goal_params
   params.require(:goal).permit(:weekly_goal, :activity_id, :status)
  end

end
