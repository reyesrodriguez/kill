class AddImageFileNameToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :image_file_name, :string
  end
end
