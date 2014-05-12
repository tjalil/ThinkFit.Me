class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: {minimum: 6}
  validates :email, uniqueness: true, presence: true
  validates_presence_of :name, :gender, :height, :weight 

  has_many :goals
  has_many :activities, through: :goals

end
