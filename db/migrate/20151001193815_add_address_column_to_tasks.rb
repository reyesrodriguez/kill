class AddAddressColumnToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :address, :string
  end
end
