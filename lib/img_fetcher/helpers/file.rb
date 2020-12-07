require 'securerandom'

module ImgFetcher
  module Helpers
    class File
      # All the valid image mime types
      VALID_MIME_TYPES = ['image/bmp', 'image/cis-cod', 'image/gif', 'image/ief', 'image/jpeg',
                          'image/jpeg', 'image/jpeg', 'image/pipeg', 'image/svg+xml', 'image/tiff',
                          'image/tiff', 'image/x-cmu-raster', 'image/x-cmx', 'image/x-icon',
                          'image/x-portable-anymap', 'image/x-portable-bitmap',
                          'image/x-portable-graymap', 'image/x-portable-pixmap', 'image/x-rgb',
                          'image/x-xbitmap', 'image/x-xpixmap', 'image/x-xwindowdump'].freeze

      # SecureRandom is to avoid collisions between already existing files
      def self.save(temp_file, directory)
        if VALID_MIME_TYPES.include?(temp_file.content_type)
          FileUtils.mv(temp_file.path,
                       "#{directory}#{SecureRandom.hex(6)}-#{temp_file.original_filename}")
          true
        else
          temp_file.unlink # deletes the temp file
          false
        end
      end
    end
  end
end
