RSpec.describe ImgFetcher::Helpers::Terminal do
  subject(:terminal) { described_class }

  describe 'self.print_line_status' do
    context 'when status is TRUE' do
      it 'prints RETRIEVED to console' do
        expect { terminal.print_line_status('line', 1, true) }
          .to output("1, RETRIEVED, line\n").to_stdout
      end
    end

    context 'when status is FALSE' do
      it 'prints NOT RETRIEVED to console' do
        expect { terminal.print_line_status('line', 1, false) }
          .to output("1, NOT RETRIEVED, line\n").to_stdout
      end
    end
  end
end
