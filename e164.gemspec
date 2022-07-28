# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'e164/version'

Gem::Specification.new do |spec|
  spec.name          = "e164"
  spec.version       = E164::VERSION
  spec.authors       = ["Collin"]
  spec.email         = ["collin@remind101.com"]
  spec.summary       = %q{A ruby equivalent of e164.js}
  spec.description   = %q{Because regex is the answer to everything}
  spec.homepage      = ""
  spec.license       = ""

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
