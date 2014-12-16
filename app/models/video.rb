class Video < ActiveRecord::Base

  has_attached :encoding, styles: {
    webm: { extension: '.webm' },
    mp4:  { extension: '.mp4'  },
    ogv:  { extension: '.ogv'  },
  }

  after_save do 
    remote.encode(self.encoding.url)
  end

end
