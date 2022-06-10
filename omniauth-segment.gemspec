# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth/segment/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'omniauth'
  gem.add_dependency 'oauth2'
  gem.add_dependency 'omniauth-oauth2'

  gem.authors       = ['Brian Norton']
  gem.email         = ['brian@trychameleon.com']
  gem.description   = %q{An OmniAuth strategy for authenticating with the Segment API.}
  gem.summary       = %q{OmniAuth strategy for authenticating with Segment.}
  gem.homepage      = 'https://github.com/chamaeleonidae/omniauth-segment'
  gem.license       = 'MIT'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'omniauth-segment'
  gem.require_paths = ['lib']
  gem.version       = OmniAuth::Segment::VERSION
end

