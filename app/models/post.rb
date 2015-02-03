class Post < ActiveRecord::Base
  has_attached_file :video

  validates_attachment :video, content_type: { content_type: ["video/webm", "video/ogv", "video/avi", "video/wmv", "video/ogg", "video/mpeg", "video/mp4"] }

end
