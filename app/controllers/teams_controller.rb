class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team[:user_id] = current_user.id
    if @team.save
      redirect_to dashboard_user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def show
    @team = Team.find(params[:id])

    @comment = Comment.new
    @comments = Comment.order('comments.created_at DESC').page params[:page]
    
    if current_user
    end
  end

  private
  def team_params
    params.require(:team).permit(:name, :description, :user_id)
  end


end
