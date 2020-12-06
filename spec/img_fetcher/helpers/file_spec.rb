require 'securerandom'

RSpec.describe ImgFetcher::Helpers::File do
  let!(:directory) { 'spec/support/tmp/' }

  describe 'self.save' do
    subject(:file_helper) { described_class.save(temp_file, directory) }

    let(:temp_file) do
      file = Tempfile.new
      file.write('Sample text')
      file.close
      file
    end

    context 'when temp_file has a valid image mime type' do
      let(:content_type) { 'image/jpeg' }
      let(:filename)     { "#{SecureRandom.hex(6)}.jpeg" }

      before do
        allow(temp_file).to receive(:content_type).and_return(content_type)
        allow(temp_file).to receive(:original_filename).and_return(filename)
      end

      it 'increments by one the files in the given directory' do
        expect { file_helper }.to change {
          Dir[File.join(directory, '**', '*')].count { |file| File.file?(file) }
        }.by(1)
      end

      it 'returns true' do
        expect(file_helper).to eq(true)
      end
    end

    context 'when temp_file don\'t has a valid image mime type' do
      let(:content_type) { 'application/xml' }
      let(:filename)     { "#{SecureRandom.hex(6)}.xml" }

      before do
        allow(temp_file).to receive(:content_type).and_return(content_type)
        allow(temp_file).to receive(:original_filename).and_return(filename)
      end

      it 'doesn\'t increment by one the files in the given directory' do
        expect { file_helper }.to change {
          Dir[File.join(directory, '**', '*')].count { |file| File.file?(file) }
        }.by(0)
      end

      it 'returns false' do
        expect(file_helper).to eq(false)
      end
    end
  end
end
