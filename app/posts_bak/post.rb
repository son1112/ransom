class Post < ActiveRecord::Base

  #has_attached_file :video, :styles => { :mobile => { :geometry => "400x300", :format => 'mp4', :streaming => true } }, :processors => [:ffmpeg, :qtfaststart]

  has_attached_file :video
  #do_not_validate_attachment_file_type :video
  validates_attachment_presence :video

  validates_attachment_file_name :video, :matches => [/webm\Z/, /ogv\Z/, /avi\Z/, /wmv\Z/, /ogg\Z/, /mpeg\Z/, /mp4\Z/, /mov\Z/, /MOV\Z/ ]

  validates_attachment_content_type :video, content_type: { content_type: ["video/webm", "video/ogv", "video/avi", "video/wmv", "video/ogg", "video/mpeg", "video/mp4"] }
  
  after_create :convert_in_ogv, :set_new_filename
  
  def convert_in_ogv
    ogv = File.join(File.dirname(video.path), "#{id}.ogv")
    system("ffmpeg -y -i #{video.path} -acodec libvorbis -ac 2 -ab 96k -ar 44100 -b 345k -s 640x360 #{ogv}")
  end

  def set_new_filename
    update_attribute(:video_file_name, "#{id}.ogv")
  end
  
  #GRAVEYARD(zombies?)
  #mount_uploader :video, VideoUploader
  # #validates_attachment_presence :video
  
end
