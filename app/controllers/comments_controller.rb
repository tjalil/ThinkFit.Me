class CommentsController < ApplicationController
	before_filter :require_login, :load_commentable

	def new
		@comment = @commentable.comments.new		
	end

	def create
		@comment = @commentable.comments.build(comment_params)
		@comments = @commentable.comments
		@comment.user_id = current_user.id

		respond_to do |format|
			if @comment.save
				format.html {redirect_to polymorphic_path(@commentable)}
				format.js {}
			else
				format.html {render polymorphic_path}
				format.js {}
			end
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:commentable_type,:commentable_id,:comment)
	end

	def load_commentable
    	if params[:team_id]	
    		@commentable = Team.find(params[:team_id])
    	else
    		@commentable = User.find(params[:user_id])
    	end
  	end
end
