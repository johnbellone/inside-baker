lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)
require 'inside_baker/version'

Gem::Specification.new do |gem|
  gem.name = 'inside-baker'
  gem.version = InsideBaker::VERSION
  gem.author = 'John Bellone'
  gem.email = 'jbellone@bloomberg.net'
  gem.description = 'Simple tool cooking enterprise base images.'
  gem.summary = IO.read(File.expand_path('../README.md', __FILE__))
  gem.homepage = 'https://github.com/johnbellone/inside-baker'
  gem.license = 'Apache 2.0'

  gem.files = `git ls-files`.split($/)
  gem.executables = gem.files.grep(%r{^bin/baker})
  gem.test_files = gem.files.grep(%r{^test/})
  gem.require_paths = ['lib']
  
  gem.required_ruby_version = '>= 1.9.3'

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'coveralls'
  gem.add_development_dependency 'guard-minitest'
  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'rake'

  gem.add_dependency 'dotenv', '~> 0.9'
  gem.add_dependency 'thor', '~> 0.18'
  gem.add_dependency 'hashie', '~> 2.0'
end
