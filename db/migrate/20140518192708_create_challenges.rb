class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer :challengeable_id
      t.string :challengeable_type
      t.integer :defendable_id
      t.string :defendable_type

      t.timestamps
    end
  end
end
