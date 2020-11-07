class AddRapperToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :rapper, :string
  end
end
