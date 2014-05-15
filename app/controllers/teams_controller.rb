class TeamsController < ApplicationController
  before_filter :load_commentable, except: [:join]

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team[:owner_id] = current_user.id
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
    @comment = @commentable.comments.build
    @comments = @commentable.comments.order('comments.created_at DESC').page params[:page]
  end


  def join
    team_users = Team.where(id: params[:team_id]).take.users 

    if team_users.where(id: current_user.id) == []
      team_users << current_user
      redirect_to team_path(params[:team_id])
    end
  end

  private
  def team_params
    params.require(:team).permit(:name, :description, :user_id)
  end

  def load_commentable
    @commentable = Team.find(params[:id])
  end

end
