class Team < ActiveRecord::Base
  belongs_to :owner, foreign_key: 'owner_id', class_name: 'User'
  has_and_belongs_to_many :users
  has_many :comments, as: :commentable
  before_save :capitalize_name

  mount_uploader :avatar, AvatarUploader

  private

  def capitalize_name
    self.name = self.name.split.map(&:capitalize).join(' ')
  end

end