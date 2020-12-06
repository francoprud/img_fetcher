module ImgFecther
  class Main
    def initialize(arguments)
      @arguments = arguments
    end

    def run
      File.open(@arguments[:file_path], 'r').each do |line|
        download(line)
      end
    end
  end
end
