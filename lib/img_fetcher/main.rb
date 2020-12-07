module ImgFetcher
  class Main
    def initialize(arguments)
      @arguments = arguments
      @stats = Stats.new
    end

    def run
      File.open(@arguments[:file_path], 'r').each do |line|
        @stats.add_line
        download(line)
      end
    end

    def download(line)
      temp_file = URL.download(line)
      return unless temp_file && Helpers::File.save(temp_file, @arguments[:output_directory])
      @stats.add_retrieved_image
    end
  end
end
