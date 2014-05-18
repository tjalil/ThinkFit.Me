class MakeUserPasswordAndSaltNullable < ActiveRecord::Migration
  def change
  	change_column :users, :crypted_password, :string, null: true
  	change_column :users, :salt, :string, null: true
  end
end
