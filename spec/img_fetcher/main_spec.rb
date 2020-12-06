RSpec.describe ImgFetcher::Main do
  subject(:main) { described_class.new(arguments) }

  describe '.run' do
    let(:arguments) do
      {
        file_path: 'spec/support/plaintext_files/valid_file.txt',
        output_directory: 'spec/support/tmp/'
      }
    end

    context 'when input file contains valid URLs' do
      it 'increments the files in the given directory' do
        stub_request(:get, 'https://onaliternote.files.wordpress.com/2016/11/wp-1480230666843.jpg')
          .with(headers: { 'Accept' => '*/*' }).to_return(
            status: 200, body: 'body', headers: { 'Content-Type' => 'image/jpeg' }
          )
        stub_request(:get, 'https://upload.wikimedia.org/wikipedia/commons/8/84/Example.svg')
          .with(headers: { 'Accept' => '*/*' }).to_return(
            status: 200, body: 'body', headers: { 'Content-Type' => 'image/svg+xml' }
          )

        expect { main.run }.to change {
          Dir[File.join(arguments[:output_directory], '**', '*')].count { |file| File.file?(file) }
        }.by(2)
      end
    end
  end
end
