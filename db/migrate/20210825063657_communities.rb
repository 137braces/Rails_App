class Communities < ActiveRecord::Migration[6.0]
  def change
    add_column :communities, :genre, :integer
  end
end
