class ActivityLogsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @activity_log = ActivityLog.new
    @goal = Goal.find(params[:goal_id])
  end

  def create
    @activity_log = ActivityLog.new(activity_log_params)

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
    params.require(:activity_log).permit(:goal_id, :duration, :intensity, :distance)
  end

end
