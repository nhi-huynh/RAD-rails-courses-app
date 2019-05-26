class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name, :null => false
      t.string :prerequisite, :null => false
      t.integer :coordinator_id, :null => false
      t.integer :likes, :default => 0
      t.integer :dislikes, :default => 0
      t.string :description, :default => "None"
      t.timestamps
    end
  end
end
