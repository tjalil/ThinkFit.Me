class CreateActivityLogs < ActiveRecord::Migration
  def change
    create_table :activity_logs do |t|
      t.belongs_to :goal
      
      t.integer :duration
      t.string :intensity
      t.decimal :distance, precision: 5, scale: 2

      t.timestamps
    end
  end
end
