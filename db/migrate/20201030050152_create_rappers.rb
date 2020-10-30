class CreateRappers < ActiveRecord::Migration[6.0]
  def change
    create_table :rappers do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
