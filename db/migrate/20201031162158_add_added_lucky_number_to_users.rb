class AddAddedLuckyNumberToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :add_lucky_number, :boolean, :default => false
  end
end
