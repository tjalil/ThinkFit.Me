class Team < ActiveRecord::Base
  belongs_to :owner, foreign_key: 'owner_id', class_name: 'User'
  has_and_belongs_to_many :users
  has_many :comments, as: :commentable
  before_save :capitalize_name

  has_many :challenges, as: :challengeable
  has_many :inverse_challenges, as: :defendable, class_name: "Challenge", foreign_key: "defendable_id"
 
  mount_uploader :avatar, AvatarUploader

  private

  def capitalize_name
    self.name = self.name.split.map(&:capitalize).join(' ')
  end

end
