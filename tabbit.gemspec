Gem::Specification.new do |s|
  s.name          = 'tabbit'
  s.version       = '0.1.0'
  s.summary       = 'Make tables in the command line.'
  s.description   = 'Tabbit is a simple tool for making tables in the command line.'
  s.authors       = ['Tim Green']
  s.email         = 'tiimgreen@gmail.com'
  s.homepage      = 'https://github.com/tiimgreen/tabbit'
  s.license       = 'MIT'

  s.files         = ['lib/tabbit.rb']
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'pry'

  s.add_runtime_dependency 'toc'
end
