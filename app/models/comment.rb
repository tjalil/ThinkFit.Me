class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true


	paginates_per 10
end
