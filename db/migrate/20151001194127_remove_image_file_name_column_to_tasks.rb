class RemoveImageFileNameColumnToTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :image_file_name, :string
  end
end
