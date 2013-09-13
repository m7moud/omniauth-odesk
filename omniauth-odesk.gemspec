# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-odesk/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'omniauth-oauth', '~> 1.0.1'
  gem.add_dependency 'json', '~> 1.8.0'

  gem.authors           = ["Jignesh Gohel"]
  gem.email             = ["jignesh.gohel@botreeconsulting.com"]
  gem.description       = %q{Odesk strategy for OmniAuth.}
  gem.summary           = %q{Odesk strategy for OmniAuth.}
  gem.homepage          = "https://github.com/JigneshGohel-BoTreeConsulting/omniauth-odesk"
  gem.license           = "MIT"

  gem.executables       = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files             = `git ls-files`.split("\n")
  gem.test_files        = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name              = "omniauth-odesk"
  gem.require_paths     = ["lib"]
  gem.version           = OmniAuth::Odesk::VERSION

end
