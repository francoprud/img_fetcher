RSpec.describe ImgFetcher::URL do
  subject(:downloader) { described_class.download(line) }

  describe 'self.download' do
    context 'when receiving a valid URL' do
      let(:line) { 'https://images.myserver.com/valid_image.jpg' }

      it 'returns a Tempfile' do
        stub_request(:get, line).with(headers: { 'Accept' => '*/*' }).to_return(
          status: 200, body: '', headers: {}
        )

        expect(downloader.class).to eq(Tempfile)
      end
    end

    context 'when receiving an invalid URL' do
      let(:line) { 'invalid_url' }

      it 'returns nil' do
        expect(downloader).to eq(nil)
      end
    end

    context 'when request has an error' do
      let(:line) { 'https://images.myserver.com/server_error.jpg' }

      it 'returns nil' do
        stub_request(:get, line).with(headers: { 'Accept' => '*/*' }).to_return(
          status: 500, body: '', headers: {}
        )

        expect(downloader).to eq(nil)
      end
    end
  end
end
