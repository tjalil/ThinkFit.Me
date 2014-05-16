class TeamsController < ApplicationController
  before_filter :load_commentable, except: [:index,:join, :new, :create]

  def index
    @teams = if params[:search]
      Team.where("name ILIKE ?", "%#{params[:search]}%")
    else
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
    team_users = Team.where(id: params[:team_id]).take.users 

    respond_to do |format|
      if team_users.where(id: current_user.id) == []
        format.html {
          team_users << current_user
          redirect_to team_path(params[:team_id]), notice: "Welcom to the team!"
        }
        format.js {}
      elsif
        format.html{ redirect_to team_path(params[:team_id]), alert: "Unable to join, you may already be a member"}
        format.js {}
      end

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
