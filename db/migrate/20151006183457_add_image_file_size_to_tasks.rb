class AddImageFileSizeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :image_file_size, :integer
  end
end
