# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'campfire_chat/version'

Gem::Specification.new do |spec|
  spec.name          = "campfire_chat"
  spec.version       = CampfireChat::VERSION
  spec.authors       = ["Richard Luther"]
  spec.email         = ["richard.luther@gmail.com"]
  spec.description   = %q{Monitor a campfire room for messages to notify via growl}
  spec.summary   = %q{Monitor a campfire room for messages to notify via growl}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'tinder'
  spec.add_dependency 'growl'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
