module ImgFetcher
  module Helpers
    class Terminal
      def self.print_headlines(file_path, output_directory)
        puts 'Starting process...'
        puts "Reading from: #{file_path}"
        puts "Images will be downloaded to: #{output_directory}\n\n"
      end

      def self.print_line_status(line, index, status)
        log = status ? 'RETRIEVED' : 'NOT RETRIEVED'
        puts "#{index}, #{log}, #{line}"
      end

      def self.print_general_status(stats)
        puts "\nRetrieved #{stats.retrieved_images} image(s) from a total of #{stats.total_lines}."
      end
    end
  end
end
