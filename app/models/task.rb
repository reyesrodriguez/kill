class Task < ActiveRecord::Base
	has_many :taskings
	has_many :users, through: :taskings
  # Paperclip atttachments
  # has_attached_file :image, :styles =>{large: "400x400>",medium: "300x300>",small: "150x150#"}
  
                    
  # validates_attachment_size :image, :less_than => 2.megabytes
  # validates_attachment_content_type :image, content_type: ["image/jpeg","image/jpg","image/png"]

  # validates :title, presence: true
  # validates :content, presence: true
  # validates :duedate, presence: true
  # validates :location, presence: true
  # validates :state, presence: true

end
