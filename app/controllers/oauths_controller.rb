class OauthsController < ApplicationController
  skip_before_filter :require_login

  # sends user on trip to provider (facebook),
  # and after authorizing there back to callback url
  def oauth
  	login_at(params[:provider])
  end

  def callback
  	provider = params[:provider]
  	if @user = login_from(provider)
  		redirect_to dashboard_user_path(@user), :notice => "Logged in from #{provider.titleize}"
  	else
  		begin
  			@user = create_from(provider)
  			# NOTE: this is the place to add '@user.activate!' if using user_activaiton submodule

  			reset_session # protect from session fixation attack
  			auto_login(@user)
  			redirect_to dashboard_user_path(@user), :notice => "Logged in from #{provider.titleize}"
  		rescue
  			redirect_to dashboard_user_path(@user), :alert => "Failed to log in from #{provider.titleize}"
  		end
  	end
  end

  private

  def auth_params
  	params.permit(:code, :provider)
  end

end
