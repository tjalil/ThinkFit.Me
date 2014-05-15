class ChangeTeamsColumnUserToOwnerId < ActiveRecord::Migration
  def change
    remove_column :teams, :user_id, :integer

  	add_column :teams, :owner_id, :integer
  end
end
