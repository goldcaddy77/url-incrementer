# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'url_incrementer/version'

Gem::Specification.new do |gem|
  gem.name          = "url_incrementer"
  gem.version       = UrlIncrementer::VERSION
  gem.authors       = ["Dan Caddigan"]
  gem.email         = ["goldcaddy77@gmail.com"]
  gem.description   = %q{URL incremeter for traversing web pages}
  gem.summary       = %q{URL incremeter for traversing web pages}
  gem.homepage      = ""
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
end