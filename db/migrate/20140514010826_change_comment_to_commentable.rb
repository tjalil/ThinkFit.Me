class ChangeCommentToCommentable < ActiveRecord::Migration
  def change
  	remove_column :comments, :user_id

  	add_column :comments, :commentable_type, :string
  	add_column :comments, :commentable_id, :integer
  end
end
