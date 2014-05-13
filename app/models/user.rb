class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_presence_of :name, :gender, :height, :weight 
  validates_presence_of :email, uniqueness: true
  validates_presence_of :password, length: { minimum: 6 }

  has_many :goals
  accepts_nested_attributes_for :goals, reject_if: :all_blank, allow_destroy: true 

  has_many :activities, through: :goals

  has_many :comments
end
