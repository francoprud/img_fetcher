module ImgFetcher
  class Stats
    attr_reader :total_lines, :retrieved_images

    def initialize
      @total_lines      = 0
      @retrieved_images = 0
    end

    def add_line
      @total_lines += 1
    end

    def add_retrieved_image
      @retrieved_images += 1
    end
  end
end
