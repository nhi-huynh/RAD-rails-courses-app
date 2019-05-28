class CreateCoordinators < ActiveRecord::Migration[5.1]
  def change
    create_table :coordinators do |t|
      
      t.string :name, :null => false
      t.string :email, unique: true, :null => false
      t.string :photo_url
      t.string :password_digest, :null => false
      
      t.boolean :is_admin, :default => false
      t.string :remember_digest
      t.timestamps
    end
  end
end
