class Challenge < ActiveRecord::Base
  belongs_to :challengeable, polymorphic: true
  belongs_to :defendable, polymorphic: true, class_name: "Challenge"
end
