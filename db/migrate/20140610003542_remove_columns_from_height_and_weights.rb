class RemoveColumnsFromHeightAndWeights < ActiveRecord::Migration
  def change
    remove_column :height_and_weights, :ideal_weight_male_kg, :decimal
    remove_column :height_and_weights, :ideal_weight_female_kg, :decimal

    add_column :height_and_weights, :ideal_weight_male_pounds, :decimal
    add_column :height_and_weights, :ideal_weight_female_pounds, :decimal
  end
end
