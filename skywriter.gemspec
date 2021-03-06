# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skywriter/version'

Gem::Specification.new do |spec|
  spec.name          = "skywriter"
  spec.version       = Skywriter::VERSION
  spec.authors       = ["Ryan Michael", "Ben Hamill"]
  spec.email         = ["ryanmichael@otherinbox.com", "ben@context.io"]
  spec.summary       = %q{Writes cloud formations}
  spec.description   = %q{Writes AWS CloudFormation templates.}
  spec.homepage      = "https://github.com/otherinbox/skywriter#readme"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "require_all", "~> 1.3"
  spec.add_dependency "activesupport", "~> 4.0"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "fuubar"
end
