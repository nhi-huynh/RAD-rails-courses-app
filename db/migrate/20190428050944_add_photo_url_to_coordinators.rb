class AddPhotoUrlToCoordinators < ActiveRecord::Migration[5.1]
  def change
    add_column :coordinators, :photo_url, :string
  end
end
