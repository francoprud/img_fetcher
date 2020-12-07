module ImgFetcher
  class Main
    def initialize(arguments)
      @arguments = arguments
      @stats = Stats.new
      @terminal = Helpers::Terminal
    end

    def run
      if @arguments[:verbose]
        @terminal.print_headlines(@arguments[:file_path], @arguments[:output_directory])
      end

      File.open(@arguments[:file_path], 'r').each_with_index do |line, index|
        @stats.add_line
        download(line, index + 1)
      end

      @terminal.print_general_status(@stats) if @arguments[:verbose]
    end

    private

    def download(line, index)
      temp_file = URL.download(line)
      if temp_file && Helpers::File.save(temp_file, @arguments[:output_directory])
        @stats.add_retrieved_image
        @terminal.print_line_status(line, index, true) if @arguments[:verbose]
      elsif @arguments[:verbose]
        @terminal.print_line_status(line, index, false)
      end
    end
  end
end
