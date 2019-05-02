class CreateCategoriesCourses < ActiveRecord::Migration[5.1]
  def change
    # create_table :courses_categories do |t|
    create_table :categories_courses, id: false do |t|
      t.integer :category_id, null: false
      t.integer :course_id, null: false
    end
  end
end
