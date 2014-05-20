class UsersController < ApplicationController
  before_filter :require_login, only: [:show, :edit, :update, :destroy]
  before_filter :load_commentable, except: [:index, :new, :create]

  def index
    @users = if params[:search]
      User.where("name ILIKE ?", "%#{params[:search]}%")
    else
    end

    respond_to do |format|
      format.html
      format.js 
    end
  end

  def dashboard #main page for user. user redirected to this page after signup/login
    @comment = @commentable.comments.build
    @comments = @commentable.comments.order('comments.created_at DESC').page params[:page]
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user) 
      redirect_to new_user_goal_path(@user), notice: "Welcome to ThinkFit.Me!"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to dashboard_user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :height, :weight, :gender, :avatar, :remote_avatar_url)
  end

   def load_commentable
    @commentable = User.find(params[:id])
  end

end
