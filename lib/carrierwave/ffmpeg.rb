require 'streamio-ffmpeg'
module CarrierWave
  module FFMPEG
    module ClassMethods
      def resample( bitrate )
        process :resample => bitrate
      end
    end
    
    def resample( bitrate )
      directory = File.dirname( current_path )
      tmpfile   = File.join( directory, "tmpfile" )
      

      FileUtils.mv( current_path, tmpfile )
      
      file = ::FFMPEG::Movie.new(tmpfile)
      file.transcode( current_path, :audio_bitrate => bitrate)

      File.delete( tmpfile )
    end
  end
end
