class RemoveLocationColumnToTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :location, :string
  end
end
