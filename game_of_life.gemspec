# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "game_of_life/version"

Gem::Specification.new do |spec|
  spec.name          = "game_of_life"
  spec.version       = GameOfLife::VERSION
  spec.authors       = ["Ylan Segal"]
  spec.email         = ["ylan@segal-family.com"]
  spec.description   = "Conway's Game of Life Simulation"
  spec.summary       = "My take on the game of life, according to the rules posted on: http://en.wikipedia.org/wiki/Conway's_Game_of_Life"
  spec.homepage      = "https://github.com/ylansegal/game_of_life"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "curses", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "pry"
end
