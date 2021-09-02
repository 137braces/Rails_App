class Users < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :content, :text
    add_column :users, :tweet, :string
  end
end
