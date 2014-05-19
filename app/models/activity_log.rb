class ActivityLog < ActiveRecord::Base

	belongs_to :goal

  # this rounds points to the nearest ten
  def round_points(number)
    new_num = number/10.0
    rounded_num = new_num.round
    multiply_num = rounded_num*10
  end

  def calculate_points
    activity_by_type = Activity.find_by(type_of_activity: self.intensity)
    initial_points = (activity_by_type.met)*(self.duration)
    final_points = round_points(initial_points)
    final_points
  end

  def show_points
    if self.intensity
      self.calculate_points

    elsif self.distance
      goal = Goal.find(self.goal_id)

      if Activity.find(goal.activity_id).name == "Cycling"
        duration_in_hours = (self.duration)/60.0
        speed = (self.distance)/(duration_in_hours)
        if speed < 5.0
          initial_points = 2.0*(self.duration)
          final_points = round_points(initial_points)
          final_points
        elsif speed >= 5.0 && speed < 8.0
          self.intensity = "5.0-7.9 mph"
          self.calculate_points
        elsif speed >= 8.0 && speed < 10.0
          self.intensity = "8.0-9.9 mph"
          self.calculate_points  
        elsif speed >= 10.0 && speed < 12.0
          self.intensity = "10.0-11.9 mph"
          self.calculate_points
        elsif speed >= 12.0 && speed < 14.0
          self.intensity = "12.0-13.9 mph"
          self.calculate_points
        elsif speed >= 14.0 && speed < 16.0
          self.intensity = "14.0-15.9 mph"
          self.calculate_points  
        elsif speed >= 16.0 && speed < 20.0
          self.intensity = "16.0-19.0 mph"
          self.calculate_points  
        elsif speed >= 20.0
          self.intensity = ">20mph"
          self.calculate_points    
        end
      end
    end
  end

end
