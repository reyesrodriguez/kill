class CreateMessagingTable < ActiveRecord::Migration
  def change
    create_table :messagings do |t|
		t.integer "user_id"			
		t.integer "message_id"    	
    end
  end
end
