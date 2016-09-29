class Upload < ActiveRecord::Base
  has_attached_file :image,
                  :storage => :s3,
                  :s3_credentials => {
                  	:bucket => "taomina", 
                  	:access_key_id => ENV["aws_access_key"], 
                  	:secret_access_key => ENV["aws_secret_key"]
                  }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end