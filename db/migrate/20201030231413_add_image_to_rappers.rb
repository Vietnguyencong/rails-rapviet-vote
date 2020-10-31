class AddImageToRappers < ActiveRecord::Migration[6.0]
  def change
    add_column :rappers, :image, :string
  end
end
