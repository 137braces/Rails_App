class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :blood_type, :string
    add_column :users, :residence, :integer
    add_column :users, :Birthplace, :integer
    add_column :users, :job, :integer
    add_column :users, :height, :integer
    add_column :users, :Body_shape, :integer
    add_column :users, :holiday, :integer
    add_column :users, :Housemate, :integer
    add_column :users, :Personality, :integer
    add_column :users, :Sociability, :integer
    add_column :users, :tobacco, :integer
    add_column :users, :drink, :integer
    add_column :users, :to_want_marry,:integer
    add_column :users, :to_want_child,:integer
  end
end
