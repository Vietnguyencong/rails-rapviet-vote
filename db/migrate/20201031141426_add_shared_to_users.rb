class AddSharedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :shared, :boolean, :default => false
  end
end
