class FriendshipsController < ApplicationController

  def index
  end
  
  def show 
    
  end


  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "You're now following #{User.find(params[:friend_id]).name}! You can't see their full page until they follow you!"
      redirect_to friendships_path
    else
      flash[:alert] = "Sorry, your follow request raised an error..."
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    if @friendship.destroy
      redirect_to friendships_path
    else
      flash[:alert] = "IT WORKS"
    end
  end
  private
  def friendship_params
    params.permit(:friend_id, :user_id)
  end
end
