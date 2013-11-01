# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nokia_music/version'

Gem::Specification.new do |gem|
  gem.name          = "nokia_music"
  gem.version       = NokiaMusic::VERSION
  gem.authors       = ["David Anderson"]
  gem.email         = ["davidmartinanderson@gmail.com"]
  gem.description   = "A simple ruby wrapper around the Nokia Music API"
  gem.summary       = "A gem to get me musical info from Nokia's API"
  gem.homepage      = "https://github.com/davidmanderson/nokia_music"
  
  gem.add_runtime_dependency('rash', '~> 0.3')
  gem.add_runtime_dependency('faraday_middleware', '~> 0.7')
  gem.add_runtime_dependency('multi_json', '~> 1.0')

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
