class MakeHeightWeightAndGenderNullable < ActiveRecord::Migration
  def change
  	change_column :users, :name, :string, null: true
  	change_column :users, :height, :integer, null: true
  	change_column :users, :weight, :integer, null: true
  	change_column :users, :gender, :string, null: true
  end
end
