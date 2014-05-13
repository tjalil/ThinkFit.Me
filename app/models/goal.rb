class Goal < ActiveRecord::Base

	belongs_to :user
	belongs_to :activity
	
  def name_of_activity
    "#{Activity.find(self.activity_id).name}"
  end
end
