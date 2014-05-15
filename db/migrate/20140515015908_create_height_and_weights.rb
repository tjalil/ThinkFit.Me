class CreateHeightAndWeights < ActiveRecord::Migration
  def change
    create_table :height_and_weights do |t|
      t.decimal :height, precision: 3, scale: 1
      t.decimal :ideal_weight_male_kg, precision: 4, scale: 1
      t.decimal :ideal_weight_female_kg, precision: 4, scale: 1

      t.timestamps
    end
  end
end
