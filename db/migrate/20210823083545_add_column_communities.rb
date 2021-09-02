class AddColumnCommunities < ActiveRecord::Migration[6.0]
  def change
    add_column :communities, :category, :integer
  end
end
