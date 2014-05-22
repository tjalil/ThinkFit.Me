class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentication_class = Authentication
  end

  mount_uploader :avatar, AvatarUploader

  # accepts_nested_attributes_for :authentications

  validates_presence_of :name, :gender, :height, :weight 
  validates_presence_of :email, uniqueness: true
  validates_presence_of :password, length: { minimum: 6 }

  has_many :authentications, :dependent => :destroy
  has_many :goals
  has_many :activities, through: :goals
  has_many :teams, as: :owner
  has_and_belongs_to_many :teams
  has_many :comments, as: :commentable
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_many :challenges, as: :challengeable
  has_many :inverse_challenges, as: :defendable, class_name: "Challenge", foreign_key: "defendable_id"

  before_save :capitalize_name

  def count_pending_requests
    count ||= 0
    if self.inverse_friendships
      self.inverse_friendships.each do |friendship|
        if self.friendships.find_by(friend_id: friendship.user_id)
        else
          count += 1
        end
      end
      return count
    end
  end

  private

  def capitalize_name
    self.name = self.name.split.map(&:capitalize).join(' ')
  end

end

