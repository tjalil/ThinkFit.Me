class Challenge < ActiveRecord::Base
  belongs_to :challengeable, polymorphic: true
  belongs_to :defendable, polymorphic: true, class_name: "Challenge"

  def total_points_for_challenger
    challenger_points ||= 0

    User.find(self.challengeable_id).goals.each do |goal|
      goal.activity_logs.each do |log|
        if log.created_at >= self.created_at
          challenger_points += log.points
        end
      end
    end
    challenger_points
  end

  def total_points_for_defender
    defender_points ||= 0

    User.find(self.defendable_id).goals.each do |goal|
      goal.activity_logs.each do |log|
        if log.created_at >= self.created_at
          defender_points += log.points
        end
      end
    end
    defender_points
  end

end
