module ImgFetcher
  class Main
    def initialize(arguments)
      @arguments = arguments
      @stats = Stats.new
      @terminal = Helpers::Terminal
      @threads = [] if @arguments[:threaded]
    end

    def run
      start_stats
      File.open(@arguments[:file_path], 'r').each_with_index do |line, index|
        if @arguments[:threaded]
          @threads << Thread.new { manage_line(line, index + 1) }
        else
          manage_line(line, index + 1)
        end
      end
      @threads.each(&:join) if @arguments[:threaded]
      end_stats
    end

    private

    def start_stats
      @stats.start
      return unless @arguments[:verbose]
      @terminal.print_headlines(@arguments[:file_path], @arguments[:output_directory])
    end

    def end_stats
      @stats.end
      @terminal.print_general_status(@stats) if @arguments[:verbose]
    end

    def manage_line(line, index)
      @stats.add_line
      download(line, index)
    end

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
