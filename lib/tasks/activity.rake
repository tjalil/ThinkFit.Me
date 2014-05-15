namespace :activities do
  desc 'Populate the activities table with csv file data: activity, activity_description and met_kcal_per_hr_per_kg'
  task :create_activities_table => [:environment] do

    require 'csv'

    file_name = "met_values_worksheet.csv"

    CSV.foreach(file_name, headers: true) do |activity|
      Activity.create!(name: activity[0], type_of_activity: activity[1], met: activity[2])
    end
  end
end