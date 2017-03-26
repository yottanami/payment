lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'payment/version'

Gem::Specification.new do |spec|
  spec.name          = 'payment'
  spec.version       = Payment::VERSION
  spec.authors       = ['M.Serhat Dundar']
  spec.email         = 'msdundars@gmail.com'
  spec.summary       = 'Sample payment and promotions library.'
  spec.description   = 'Sample library for payments and promotions from command line.'
  spec.homepage      = 'https://github.com/msdundar/payment'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split('\x0').reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_runtime_dependency 'money'
  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
end
