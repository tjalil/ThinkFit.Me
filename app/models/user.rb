class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentication_class = Authentication
  end

  mount_uploader :avatar, AvatarUploader

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
    friends_count ||= 0
    challenges_count ||= 0

    if self.inverse_friendships
      self.inverse_friendships.each do |friendship|
        if self.friendships.find_by(friend_id: friendship.user_id)
        else
          friends_count += 1
        end
      end
      friends_count
    end

    if self.inverse_challenges
      self.inverse_challenges.each do |challenge|
        if self.challenges.find_by(defendable_id: challenge.challengeable_id)
        else
          challenges_count += 1
        end
      end
      challenges_count
    end
    return friends_count + challenges_count
  end

  def total_points
    points ||= 0
    self.goals.each do |goal|
      goal.activity_logs.each do |log|
        if log.points != nil
          points += log.points
        end
      end
    end
    points
  end

  def total_activity_logs
    attendance ||= 0
    self.goals.each do |goal|
      if goal.activity_logs != []
        attendance += goal.count_activity_log
      end
    end
    attendance
  end

  private

  def capitalize_name
    self.name = self.name.split.map(&:capitalize).join(' ')
  end

end

