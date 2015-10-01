class RemoveImageContentTypeColumnToTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :image_content_type, :string
  end
end
