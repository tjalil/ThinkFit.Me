class Team < ActiveRecord::Base
  belongs_to :owner, foreign_key: 'owner_id', class_name: 'User'
  has_and_belongs_to_many :users
  has_many :comments, as: :commentable

  has_many :challenges, as: :challengeable
  has_many :opponents, through: :challengeable
  has_many :defendable, class_name: "Challenge", foreign_key: "oppenet_id"
  has_many :defenders, through: :defendable, source: :team

  mount_uploader :avatar, AvatarUploader
end
