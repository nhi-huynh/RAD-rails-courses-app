class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :prerequisite
      t.integer :coordinator_id
      t.integer :likes
      t.integer :dislikes
      #t.string :description
      t.timestamps
    end
  end
end
