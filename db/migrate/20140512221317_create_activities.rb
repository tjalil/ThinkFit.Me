class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.decimal :met, precision: 3, scale: 1
      t.string :type_of_activity

      t.timestamps
    end
  end
end
