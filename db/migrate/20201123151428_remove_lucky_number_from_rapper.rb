class RemoveLuckyNumberFromRapper < ActiveRecord::Migration[6.0]
  def change
    remove_column :rappers, :lucky_number
  end
end
