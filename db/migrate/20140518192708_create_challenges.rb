class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer :challengeable_id
      t.string :challengeable_type
      t.integer :opponent_id
      t.string :opponent_type

      t.timestamps
    end
  end
end
