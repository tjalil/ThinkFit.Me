class UsersController < ApplicationController
  before_filter :require_login, only: [:show, :edit, :update, :destroy]

  def index
  end

  def dashboard # users stats 

  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      auto_login(@user) 
      redirect_to dashboard_user_path, notice: "You've logged in! YAY!"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @activities = Activity.last
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :name, :height, :weight, :gender)
  end
end
