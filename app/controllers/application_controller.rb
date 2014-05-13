class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception 

  # private

  # def not_authenticated
  #   redirect_to new_user_session_path, alert: "Please Log In first"
  # end
end
