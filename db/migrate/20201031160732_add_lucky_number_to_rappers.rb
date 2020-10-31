class AddLuckyNumberToRappers < ActiveRecord::Migration[6.0]
  def change
    add_column :rappers, :lucky_number, :integer
  end
end
