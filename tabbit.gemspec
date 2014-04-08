Gem::Specification.new do |s|
  s.name          = 'tabbit'
  s.version       = '0.0.0'
  s.summary       = 'Colour your outputs to the console.'
  s.description   = 'Toc is a simple tool used for colouring outputs to the console.'
  s.authors       = ['Tim Green']
  s.email         = 'tiimgreen@gmail.com'
  s.homepage      = 'https://github.com/tiimgreen/toc'
  s.license       = 'MIT'

  s.files         = ['lib/tabbit.rb']
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec'

  s.add_runtime_dependency 'toc'
end
