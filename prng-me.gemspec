# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prng/me/version'

Gem::Specification.new do |spec|
  spec.name          = "prng-me"
  spec.version       = PRNG::ME::VERSION
  spec.authors       = ["Koji Yusa"]
  spec.email         = ["odekopoon@gmail.com"]

  spec.summary       = %q{ME PRNG wrapper}
  spec.homepage      = "https://github.com/odekopoon/prng-me-ruby"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.extensions    = %w[ext/prng/me/extconf.rb]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 0.9"
  spec.add_development_dependency "minitest", "~> 5.0"
#  spec.add_development_dependency "rake-compiler", "~> 1.0"
end
