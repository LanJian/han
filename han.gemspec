# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'han/version'

Gem::Specification.new do |spec|
  spec.name          = "han"
  spec.version       = Han::VERSION
  spec.authors       = ["Jack Huang"]
  spec.email         = ["jackhxs@gmail.com"]
  spec.summary       = %q{Command line Chinese dictionary}
  spec.description   = spec.description
  spec.license       = "MIT"

  spec.files         = ['README.md',
                        'bin/han',
                        'lib/han.rb',
                        'lib/han/version.rb']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"
  spec.add_dependency "thor", "~> 0.19"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
