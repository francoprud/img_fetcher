RSpec.describe ImgFetcher::Stats do
  subject(:stats) { described_class.new }

  describe '.add_line' do
    it 'adds 1 to the total_lines instance variable' do
      expect { stats.add_line }.to change(stats, :total_lines).by(1)
    end
  end

  describe '.add_retrieved_image' do
    it 'adds 1 to the retrieved_images instance variable' do
      expect { stats.add_retrieved_image }.to change(stats, :retrieved_images).by(1)
    end
  end
end
