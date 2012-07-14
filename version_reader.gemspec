# -*- encoding: utf-8 -*-
require File.expand_path('../lib/version_reader', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Raffael Schmid"]
  gem.email         = ["raffael@yux.ch"]
  gem.description   = %q{Easily read your VERSION file and display it in different formats}
  gem.summary       = %q{Reads your VERSION file and gives the ability to display it in an easy way}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "version_reader"
  gem.require_paths = ["lib"]
  gem.version       = VersionReader.new(File.expand_path('../VERSION', __FILE__)).normal

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'watchr'
  gem.add_development_dependency 'version_bumper'
end
