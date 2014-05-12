class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,            :null => false
      t.string :crypted_password, :null => false
      t.string :salt,             :null => false
      t.string :name,			  :null => false	
      t.integer :height,		  :null => false
      t.integer :weight,		  :null => false
      t.string :gender,			  :null => false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end