class AddImageContentTypeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :image_content_type, :string
  end
end
