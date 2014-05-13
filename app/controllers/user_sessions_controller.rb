class UserSessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to dashboard_user_path(@user), notice: 'Much Success!! Logged in.'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    logout
    redirect_to :users, notice: 'Logged out!'
  end

end
