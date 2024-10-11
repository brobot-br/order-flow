# frozen_string_literal: true

require_relative 'lib/order_flow/version'

Gem::Specification.new do |spec|
  spec.name        = 'order_flow'
  spec.version     = OrderFlow::VERSION
  spec.authors     = ['Ralph Baesso']
  spec.email       = ['ralphsbaesso@gmail.com']
  spec.homepage    = 'https://github.com/brobot-br'
  spec.summary     = 'Summary of OrderFlow.'
  spec.description = 'Description of OrderFlow.'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = 'https://github.com/brobot-br'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/brobot-br'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'rails', '>= 6.1.0'
  spec.add_dependency 'uuid7', '~> 0.2.0'
end
