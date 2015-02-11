class Post < ActiveRecord::Base

  #has_attached_file :video, :styles => { :mobile => { :geometry => "400x300", :format => 'mp4', :streaming => true } }, :processors => [:ffmpeg, :qtfaststart]

  has_attached_file :video

  # formats that will need conversion or player manipulation?
  # MOV mp4 mpeg avi
  validates_attachment_file_name :video, :matches => [/webm\Z/, /ogv\Z/, /avi\Z/, /wmv\Z/, /ogg\Z/, /mpeg\Z/, /mp4\Z/, /mov\Z/, /MOV\Z/ ]

  after_create :convert_in_ogv, :set_new_filename
  #after_create :convert_in_flv

  def convert_in_ogv
    #flv = File.join(File.dirname(video.path), "#{id}.flv")
    ogv = File.join(File.dirname(video.path), "#{id}.ogv")
    #system("ffmpeg -i #{video.path} -ar 22050 -ab 32 -s 480x360 -vcodec flv -r 25 -qscale 8 -f flv -y #{flv}")
    system("ffmpeg -y -i #{video.path} -acodec libvorbis -ac 2 -ab 96k -ar 44100 -b 345k -s 640x360 #{ogv}")
  end

  def set_new_filename
    update_attribute(:video_file_name, "#{id}.ogv")
  end

  validates_attachment_presence :video
  
  #validates_attachment :video, content_type: { content_type: ["video/webm", "video/ogv", "video/avi", "video/wmv", "video/ogg", "video/mpeg", "video/mp4"] }
  validates_attachment_content_type :video, content_type: { content_type: ["video/webm", "video/ogv", "video/avi", "video/wmv", "video/ogg", "video/mpeg", "video/mp4"] }

  
  #do_not_validate_attachment_file_type :video
  
  
  #GRAVEYARD(zombies?)
  #mount_uploader :video, VideoUploader
  # #validates_attachment_presence :video
  
end
