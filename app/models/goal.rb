class Goal < ActiveRecord::Base

	belongs_to :user
	belongs_to :activity
	has_many :activity_logs

  validates_presence_of :activity_id, :weekly_goal
	
  def name_of_activity_through_goal
    Activity.find(self.activity_id).name
  end

end
