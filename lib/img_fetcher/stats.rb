module ImgFetcher
  class Stats
    attr_reader :total_lines, :retrieved_images

    def initialize
      @total_lines      = 0
      @retrieved_images = 0
      @semaphore        = Mutex.new
      @start_time       = nil
      @end_time         = nil
    end

    def add_line
      @semaphore.synchronize do
        @total_lines += 1
      end
    end

    def add_retrieved_image
      @semaphore.synchronize do
        @retrieved_images += 1
      end
    end

    def start
      @start_time = now
    end

    def end
      @end_time = now
    end

    def total_time
      @end_time - @start_time
    end

    private

    def now
      Process.clock_gettime(Process::CLOCK_MONOTONIC)
    end
  end
end
