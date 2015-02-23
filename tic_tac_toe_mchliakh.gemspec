# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tic_tac_toe_mchliakh/version'

Gem::Specification.new do |s|
  s.name          = 'tic_tac_toe_mchliakh'
  s.version       = TicTacToe::VERSION
  s.authors       = ['Mikhail Chliakhovski']
  s.email         = ['mchliakh.dev@gmail.com']
  s.summary       = 'Tic-tac-toe'
  s.description   = 'A Tic-tac-toe game that never loses'
  s.homepage      = 'http://github.com/mchliakh/tic_tac_toe'
  s.license       = 'MIT'

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 1.7'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.0'
end
