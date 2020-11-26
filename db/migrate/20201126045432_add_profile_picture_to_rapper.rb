class AddProfilePictureToRapper < ActiveRecord::Migration[6.0]
  def change
    add_column :rappers, :profile_picture, :integer, default: 0
  end
end
