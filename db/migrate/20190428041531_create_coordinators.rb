class CreateCoordinators < ActiveRecord::Migration[5.1]
  def change
    create_table :coordinators do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :password_digest, :null => false
      t.string :photo_url, :null => false
      t.timestamps
    end
  end
end
