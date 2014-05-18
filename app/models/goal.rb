class Goal < ActiveRecord::Base

	belongs_to :user
	belongs_to :activity
	has_many :activity_logs

  validates_presence_of :activity_id, :weekly_goal
	
  def name_of_activity_through_goal
    Activity.find(self.activity_id).name
  end

  def type_of_activity
    Activity.find(self.activity_id).type_of_activity
  end

  def intensity_of_activity
    if ActivityLog.find_by_goal_id(self.id) != nil
      ActivityLog.find_by_goal_id(self.id).intensity
    else
      0
    end
  end

  def duration_of_activity
    if ActivityLog.find_by_goal_id(self.id) != nil
      ActivityLog.find_by_goal_id(self.id).duration
    else
      0
    end
  end

  def distance_of_activity
    if ActivityLog.find_by_goal_id(self.id) != nil
      ActivityLog.find_by_goal_id(self.id).distance
    else
      0
    end
  end

  # this rounds points to the nearest ten
  def round_points(number)
    new_num = number/10.0
    rounded_num = new_num.round
    multiply_num = rounded_num*10
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

  def show_points
    Activity.where(name: self.name_of_activity_through_goal).each do |activity|
      # if self.intensity_of_activity == activity.type_of_activity
      #   activity_met = activity.met.to_f
      #   first_level_points = (activity_met)*(self.duration_of_activity)
      #   final_level_points = round_points(first_level_points)
      #   counter += final_level_points
      #   return counter
      # else
        counter ||= 0
        activity_met = activity.met.to_f
        first_level_points = (activity_met)*(self.duration_of_activity)
        final_level_points = round_points(first_level_points)
        counter += final_level_points
        return counter
      # end
    end
  end
end


      # if name_of_activity_through_goal == "Running"
      #   if self.intensity_of_activity == activity.type_of_activity
      #     activity_met = activity.met.to_f
      #     if self.distance_of_activity
      #       speed = (activity_met)/self.distance_of_activity
      #         TAKE THE SPEED AND COMPARE ACROSS ALL SPEED INTERVALS (CONTROL FLOW FOR ALL SPEEDS FOR RUNNING)
      #         IF SPEED BELONGS TO A PARTICULAR INTERVAL
      #  










