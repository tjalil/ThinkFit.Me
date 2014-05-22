class AddEndDateToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :end_date, :datetime
  end
end
