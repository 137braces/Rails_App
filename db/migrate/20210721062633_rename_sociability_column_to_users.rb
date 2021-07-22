class RenameSociabilityColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :Sociability, :work
  end
end
