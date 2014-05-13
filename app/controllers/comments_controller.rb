class CommentsController < ApplicationController
	before_filter :require_login

	def new
		@comment = Comment.new		# Might be able to remove when implementing AJAX
	end

	def create
		@comment = Comment.create(comment_params)
		@comment.user_id = current_user.id

		respond_to do |format|
			if @comment.save
				format.html {redirect_to dashboard_user_path(@comment.user_id)}
				format.js
			else
				format.html
				format.js
			end
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
