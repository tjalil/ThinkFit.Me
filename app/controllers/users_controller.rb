class UsersController < ApplicationController
  before_filter :require_login, only: [:show, :edit, :update, :destroy]

  def index
  end

  def dashboard #main page for user. user redirected to this page after signup/login
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
    params.require(:user).permit(:email, :password, :name, :height, :weight, :gender, goals_attributes: [:id, :weekly_goal, :_destroy])
  end

end
