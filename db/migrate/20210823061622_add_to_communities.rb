class AddToCommunities < ActiveRecord::Migration[6.0]
  def change
    add_column :communities, :image, :string
    add_column :communities, :content, :text
  end
end
