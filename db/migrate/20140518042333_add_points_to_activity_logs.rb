class AddPointsToActivityLogs < ActiveRecord::Migration
  def change
    add_column :activity_logs, :points, :integer
  end
end
