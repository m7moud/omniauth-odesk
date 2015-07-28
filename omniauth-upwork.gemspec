# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-upwork/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'omniauth-oauth', '~> 1.1.0'
  gem.add_dependency 'json', '~> 1.8.0'

  gem.authors           = ["Jignesh Gohel", "Mahmoud Ali"]
  gem.email             = ["jignesh.gohel@botreeconsulting.com"]
  gem.description       = %q{Upwork strategy for OmniAuth.}
  gem.summary           = %q{Upwork strategy for OmniAuth.}
  gem.homepage          = "https://github.com/m7moud/omniauth-upwork"
  gem.license           = "MIT"

  gem.executables       = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files             = `git ls-files`.split("\n")
  gem.test_files        = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name              = "omniauth-upwork"
  gem.require_paths     = ["lib"]
  gem.version           = OmniAuth::Upwork::VERSION
end
