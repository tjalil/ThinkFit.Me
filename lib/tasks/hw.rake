namespace :height_and_weights do
  desc 'Populate the height_and_weight table with csv file data: height, ideal_height_male_pounds and ideal_height_female_pounds'
  task :create_hw_table => [:environment] do

    require 'csv'

    file_name = "height_and_weight_data.csv"

    CSV.foreach(file_name, headers: true) do |hw|
      HeightAndWeight.create!(height: hw[0], ideal_weight_male_pounds: hw[1], ideal_weight_female_pounds: hw[2])
    end
  end  
end