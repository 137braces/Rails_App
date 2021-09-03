class Users2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :Housemate, :integer
    remove_column :users, :Personality, :integer
    remove_column :users, :tobacco, :integer
    remove_column :users, :drink, :integer
    remove_column :users, :job, :integer
    remove_column :users, :to_want_marry, :integer
    remove_column :users, :to_want_child, :integer
    
  end
end
