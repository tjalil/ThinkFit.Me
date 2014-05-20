class TeamsController < ApplicationController
  before_filter :load_commentable, except: [:index,:join, :new, :create]

  def index
    @teams = if params[:search]
      Team.where("name ILIKE ?", "%#{params[:search]}%")
    else
      Team.all
    end

    respond_to do |format|
      format.html
      format.js 
    end
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team[:owner_id] = current_user.id
    if @team.save
      @team.users << current_user
      redirect_to team_path(@team.id) 
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
    @team = Team.find(params[:team_id])
    if @team.users.find_by( id: current_user.id) 
      redirect_to team_path(@team.id), alert: "Unable to join, you may already be a member"
    elsif
      respond_to do |format|
      @team.users << current_user
        format.html { redirect_to team_path(@team.id), notice: "Welcome to the team!"}
        format.js {}
      end
    end
  end

  private
  def team_params
    params.require(:team).permit(:name, :description, :user_id, :avatar, :remote_avatar_url)
  end

  def load_commentable
    @commentable = Team.find(params[:id])
  end

end
