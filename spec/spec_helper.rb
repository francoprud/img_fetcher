require 'simplecov'
SimpleCov.start # must be issued before any of the application code is required.
require 'bundler/setup'
require 'webmock/rspec'
require 'img_fetcher'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.after(:suite) do
    Dir.foreach('spec/support/tmp') do |f|
      fn = File.join('spec/support/tmp', f)
      File.delete(fn) if f != '.' && f != '..'
    end
  end
end
