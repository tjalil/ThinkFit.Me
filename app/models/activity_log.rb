class ActivityLog < ActiveRecord::Base

	belongs_to :goal

  # this rounds points to the nearest ten
  def round_points(number)
    new_num = number/10.0
    rounded_num = new_num.round
    multiply_num = rounded_num*10
  end

  def calculate_points
    if self.intensity
      activity_by_type = Activity.find_by(type_of_activity: self.intensity)
      initial_points = (activity_by_type.met)*(self.duration)
      final_points = round_points(initial_points)
      final_points
    end
  end

end
