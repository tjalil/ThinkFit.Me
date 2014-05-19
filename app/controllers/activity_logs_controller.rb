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
    @activity_log.points = @activity_log.show_points

    if @activity_log.save
      redirect_to dashboard_user_path(current_user), notice: "Successfully logged your activity!"
    else
      render :new, alert: "There was an error. Please try again."
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @activity_log = ActivityLog.find(params[:id])
    @activity_log.destroy
    redirect_to dashboard_user_path(current_user)
  end

  private

  def activity_log_params
    params.require(:activity_log).permit(:duration, :intensity, :distance)
  end

  def find_goal
    @goal = Goal.find(params[:goal_id])
  end

  def find_user
    @user = current_user
  end
end
