class Goal < ActiveRecord::Base

	belongs_to :user
	belongs_to :activity
	has_many :activity_logs

  validates_presence_of :activity_id, :weekly_goal
  validates_numericality_of :weekly_goal, greater_than: 0
	
  def name_of_activity_through_goal
    Activity.find(self.activity_id).name
  end

  def type_of_activity
    Activity.find(self.activity_id).type_of_activity
  end

  def count_activity_log
    @activity_logs = ActivityLog.all
    activity_log_count ||= 0

    @activity_logs.each do |activity|
      if activity.goal_id == self.id
        activity_log_count += 1
      end
    end
    activity_log_count
  end

  def total_points_per_goal
    @activity_logs = ActivityLog.all
    total_points ||= 0

    @activity_logs.each do |activity|
      if activity.goal_id == self.id
        total_points += activity.points
      end
    end
    total_points 
  end

end










