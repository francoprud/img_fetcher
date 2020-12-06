require_relative 'lib/img_fetcher/version'

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
  spec.executables   = []
  spec.require_paths = ['lib']
end