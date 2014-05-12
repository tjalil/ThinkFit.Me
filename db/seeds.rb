# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Activity.create!(name: "Mountain Biking", met: "8.5", type_of_activity: "only-time")
Activity.create!(name: "Running", met: "11.0", type_of_activity: "distance")
Activity.create!(name: "Ping Pong", met: "4.0", type_of_activity: "only-time")
Activity.create!(name: "Stair Climbing", met: "6.0", type_of_activity: "intensity")
Activity.create!(name: "Swimming", met: "9.8", type_of_activity: "only-time")