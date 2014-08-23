# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stalker/version'

Gem::Specification.new do |spec|
  spec.name          = "stalker"
  spec.version       = Stalker::VERSION
  spec.authors       = ["Anirudha Ghante"]
  spec.email         = ["anirudha.ghante@gmail.com"]
  spec.summary       = %q{Command line application as a gem to stalk people on twitter.}
  spec.description   = %q{Finds tweets in which the person was mentioned.}
  spec.homepage      = ""

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["stalk"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "aruba"

end
