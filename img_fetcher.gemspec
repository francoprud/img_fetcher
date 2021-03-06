require_relative 'lib/img_fetcher/version'

# rubocop:disable Metrics/BlockLength
Gem::Specification.new do |spec|
  spec.name          = 'img_fetcher'
  spec.version       = ImgFetcher::VERSION
  spec.authors       = ['Franco Prudhomme']
  spec.email         = ['francoprud@gmail.com']

  spec.summary       = 'Command line tool for downloading images from URLs.'
  spec.description   = 'Command line tool that given a plaintext file containing URLs ' \
                       '(one per line), downloads all of them to the local hard disk.'
  spec.homepage      = 'https://github.com/francoprud/img_fetcher'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.2')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org/'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/francoprud/img_fetcher'
  # spec.metadata['changelog_uri'] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = ['img_fetcher']
  spec.require_paths = ['lib']

  # Dependencies section
  ## Runtime
  spec.add_runtime_dependency 'down', '~> 5.0'
  ## Development & Test
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.5.2'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.0.1'
  spec.add_development_dependency 'simplecov', '~> 0.20.0'
  spec.add_development_dependency 'webmock', '~> 3.10.0'
end
# rubocop:enable Metrics/BlockLength
