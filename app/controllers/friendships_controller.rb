class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Yay, you made a new friend"
      redirect_to dashboard_user_path(current_user)
    else
      flash[:alert] = "No friends for you"
      redirect_to users
    end
  end

  def destroy
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.destroy
      flash[:notice] = "Goodbye Friend, hello sadness..."
      redirect_to dashboard_user_path(current_user)
    end
  end
end
