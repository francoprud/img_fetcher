module ImgFetcher
  class CommandLine
    class MissingOptionError < StandardError; end
    DEFAULT_DIRECTORY = -'./'

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
      verbose_option
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

    def verbose_option
      @options.on('-v', '--verbose', 'Make the operation more talkative') do
        @arguments[:verbose] = true
      end
    end

    def check_required_arguments
      # Check if file_path is present and is a valid system file
      raise MissingOptionError unless @arguments[:file_path] && File.file?(@arguments[:file_path])
      # Build & check output_directory
      @arguments[:output_directory] = build_and_check_output_directory
    end

    # Checks that exists, be a valid Directory (or places the default directory),
    # and appends at the end a slash (/)
    def build_and_check_output_directory
      directory = @arguments[:output_directory]

      if directory && Dir.exist?(directory)
        directory[-1] == '/' ? directory : "#{directory}/"
      else
        DEFAULT_DIRECTORY
      end
    end
  end
end
