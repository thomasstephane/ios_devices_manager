# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ios_devices_manager/version"

Gem::Specification.new do |s|
  s.name        = 'ios_devices_manager'
  s.version     = IOSDevices::VERSION
  s.date        = '2010-07-19'
  s.summary     = %q{Localize your iDevice from your ruby app}
  s.description = %q{A simple gem to get location data of a given device, send notifications to it}
  s.authors     = ["Stephane Thomas"]
  s.email       = 'thomas.stephn@gmail.com'
  s.homepage    = %q{http://rubygems.org/gems/ios_devices_manager}
  s.licenses    = ['MIT']

  s.files       = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rake', '~> 10.3' , '>= 10.3.2'
  s.add_development_dependency 'rspec', '~> 3.0' , '>= 3.0.0'

  s.add_runtime_dependency 'json', '~> 1.8' , '>= 1.8.1'
  s.add_runtime_dependency 'typhoeus', '~> 0.6' , '>= 0.6.9'
end
