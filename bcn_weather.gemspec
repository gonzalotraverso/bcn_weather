# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bcn_weather/version'

Gem::Specification.new do |spec|
  spec.name          = "bcn_weather"
  spec.version       = BcnWeather::VERSION
  spec.authors       = ["Gonzalo Traverso"]
  spec.email         = ["gonzalotraverso@gmail.com"]

  spec.summary       = %q{CLI to query the tiempo API to find out the weather in Barcelona}
  spec.homepage      = "https://github.com/gonzalotraverso/bcn_weather.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = ["eltiempo"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency 'webmock', '~> 3.4', '>= 3.4.2'
  spec.add_dependency 'nokogiri', '~> 1.8', '>= 1.8.5'
  spec.add_dependency 'dotenv', '~> 2.5'
  spec.add_dependency 'faraday', '~> 0.15.3'
end
