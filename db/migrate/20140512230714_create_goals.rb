class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.belongs_to :user
      t.belongs_to :activity
      t.integer :weekly_goal
      	
      t.timestamps
    end
  end
end
