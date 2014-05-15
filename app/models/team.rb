class Team < ActiveRecord::Base
  belongs_to :owner, foreign_key: 'owner_id', class_name: 'User'
  has_and_belongs_to_many :users
  has_many :comments, as: :commentable
end
