module ImgFetcher
  class Main
    def initialize(arguments)
      @arguments = arguments
    end

    def run
      File.open(@arguments[:file_path], 'r').each do |line|
        download(line)
      end
    end

    def download(line)
      temp_file = URL.download(line)

      Helpers::File.save(temp_file, @arguments[:output_directory]) if temp_file
    end
  end
end
