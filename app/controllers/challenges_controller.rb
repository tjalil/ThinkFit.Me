class ChallengesController < ApplicationController
	before_filter :require_login, :load_defendable

  def new
    @comment = @commentable.comments.new		
  end

  def create
    @challengeable = current_user
    @challenge = @challengeable.challenges.build(defendable_id: @defendable.id, defendable_type: @type)

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


end
