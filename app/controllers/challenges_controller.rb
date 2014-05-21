class ChallengesController < ApplicationController
  before_filter :require_login, :load_defendable

  def index
    @user = User.find(params[:user_id])
    @challengable = @user.challenges
    @defendable = @user.inverse_challenges
    @points = total_user_points

  end


  def new
    @comment = @commentable.comments.new		
  end

  def create
    @challengeable = current_user
    @challenge = @challengeable.challenges.build(defendable_id: @defendable.id, defendable_type: @type)
    @challenge.end_date = Time.now.end_of_week + 1.week

    respond_to do |format|
      if @challenge.save
        format.html {redirect_to polymorphic_path(@defendable)}
        format.js {}
      else
        format.html {render polymorphic_path}
        format.js {}
      end
    end
  end

  private

  def challenge_params
    params.require(:defendable).permit(:defendable_id, :defendable_type)
  end

  def load_defendable
    if params[:team_id]	
      @defendable = Team.find(params[:team_id])
      @type = 'Team'
    else
      @defendable = User.find(params[:user_id])
      @type = 'User'
    end
  end

  def total_user_points  
    user_goal_points = []
    user_goal_points = Goal.where(user_id: @user.id).map do |goal| 
      goal.id
      ActivityLog.where(goal_id: goal.id).sum(:points)
    end
    score = user_goal_points.inject {|sum, point| sum += point}
    score
  end

end
