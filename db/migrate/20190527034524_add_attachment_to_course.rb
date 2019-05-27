class AddAttachmentToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :attachment, :string
    add_column :courses, :edit, :string
    add_column :courses, :app/model/course.rb, :string
  end
end
