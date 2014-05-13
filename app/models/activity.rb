class Activity < ActiveRecord::Base

	has_many :goals
	has_many :users, through: :goals

  accepts_nested_attributes_for :goals, reject_if: :all_blank, allow_destroy: true

end
