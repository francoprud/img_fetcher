module ImgFetcher
  class CommandLine
    class MissingOptionError < StandardError; end

    def initialize
      @arguments = {}
      @options = OptionParser.new
      initialize_options
    end

    def parse!
      @options.parse!
      check_required_arguments
      @arguments
    end

    private

    def initialize_options
      @options.banner = 'Usage: img_fetcher -f <file_path> [options...]'
      file_path_option
      output_directory_option
      version_option
    end

    def file_path_option
      @options.on(
        '-f FILE_PATH', '--file FILE_PATH',
        '[REQUIRED] Fetch and store the images from each line from the given file'
      ) do |file_path|
        @arguments[:file_path] = file_path
      end
    end

    def output_directory_option
      @options.on(
        '-o OUTPUT_DIRECTORY', '--output OUTPUT_DIRECTORY', 'Specify the output directory'
      ) do |output_directory|
        @arguments[:output_directory] = output_directory
      end
    end

    def version_option
      @options.on('-V', '--version', 'Show version number and quit') do
        puts ImgFetcher::VERSION
        exit
      end
    end

    def check_required_arguments
      # Check if file_path is present and is a valid system file
      return if @arguments[:file_path] && File.file?(@arguments[:file_path])
      raise MissingOptionError
    end
  end
end
