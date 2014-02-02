# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'game_of_life/version'

Gem::Specification.new do |spec|
  spec.name          = "game_of_life"
  spec.version       = GameOfLife::VERSION
  spec.authors       = ["Ylan Segal"]
  spec.email         = ["ylan@segal-family.com"]
  spec.description   = %q{Conway's Game of Life Simulation}
  spec.summary       = %q{My take on the game of life, according to the rules posted on: http://en.wikipedia.org/wiki/Conway's_Game_of_Life}
  spec.homepage      = "https://github.com/ylansegal/game_of_life"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'curses', '~> 1.0.0'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
