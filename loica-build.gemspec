# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'loica/build/version'

Gem::Specification.new do |spec|
  spec.name          = "loica-build"
  spec.version       = Loica::Build::VERSION
  spec.authors       = ["Seba Gamboa"]
  spec.email         = ["me@sagmor.com"]

  spec.summary       = %q{Loica framework build toolchain}
  spec.description   = %q{Crossbuild MRuby apps to multiple targets}
  spec.homepage      = "https://github.com/loicarb/loica-build"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rake", "~> 10.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rspec"
end
