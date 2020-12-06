RSpec.describe ImgFetcher::CommandLine do
  subject(:command_line) { described_class.new }

  describe '.parse!' do
    before do
      stub_const('ARGV', args)
    end

    context 'when ARGS are complete' do
      let(:args) { ['-f', 'spec/support/plaintext_files/valid_file.txt', '-o', './'] }

      it 'returns the arguments object' do
        expect(command_line.parse!).to eq(
          { file_path: 'spec/support/plaintext_files/valid_file.txt', output_directory: './' }
        )
      end
    end

    context 'when missing the required file_path ARG' do
      let(:args) { [] }

      it 'raises ImgFetcher::CommandLine::MissingOptionError error' do
        expect { command_line.parse! }.to raise_error(ImgFetcher::CommandLine::MissingOptionError)
      end
    end

    context 'when recieving an invalid option' do
      let(:args) { ['-i'] }

      it 'raises OptionParser::InvalidOption error' do
        expect { command_line.parse! }.to raise_error(OptionParser::InvalidOption)
      end
    end

    context 'when missing the argument of an option' do
      let(:args) { ['-f'] }

      it 'raises OptionParser::MissingArgument error' do
        expect { command_line.parse! }.to raise_error(OptionParser::MissingArgument)
      end
    end
  end
end
