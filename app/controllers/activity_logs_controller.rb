class ActivityLogsController < ApplicationController
  before_action :find_goal, only: [:new, :create]

  def index
  end

  def show
  end

  def new
    @activity_log = ActivityLog.new
  end

  def create
    @activity_log = ActivityLog.new(activity_log_params)
    @activity_log.goal_id = @goal.id

    if @activity_log.save
      redirect_to dashboard_user_path(current_user), notice: "Successfully logged in your activity!"
    else
      render :new, alert: "There was an error. Please try again."
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def activity_log_params
    params.require(:activity_log).permit(:duration, :intensity, :distance)
  end

  def find_goal
    @goal = Goal.find(params[:goal_id])
  end

end
