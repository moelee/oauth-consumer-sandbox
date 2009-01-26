class Photo < ActiveRecord::Base
  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :max_size => 10.megabytes
  
  validates_as_attachment
  
  belongs_to :user
end
