class Video < ActiveRecord::Base
  #mount_uploader :video, VideoUploader

  belongs_to :post
  
end
