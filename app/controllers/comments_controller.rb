class CommentsController < ApplicationController
	before_filter :require_login

	def new
		@comment = Comment.new		# Might be able to remove when implementing AJAX
	end

	def create
		@comment = @user.comments.build(comment_params)

		if @comment.save
			# will add respond to for AJAX
		else
			# will add respond to for AJAX
		end
	end

	def show
		@comment = Comment.find(params[:id])
	end

	private

	def comment_params
		params.require(:comment).permit(:user_id,:comment)
	end
end
