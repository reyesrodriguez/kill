class RemoveImageFileSizeColumnToTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :image_file_size, :integer
  end
end
