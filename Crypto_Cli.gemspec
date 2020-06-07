lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative './lib/crypto_cli/version.rb'

Gem::Specification.new do |spec|
  spec.name          = "Crypto_Cli"
  spec.version       = Crypto::VERSION
  spec.authors       = ["eulis01"]
  spec.email         = ["eulis01@gmail.com"]

  spec.summary       = %q{A 💎Gem💎 to Display current Crypto prices.}
  spec.description   = %q{This gem will display top 15 currency information.}
  spec.homepage      = "https://github.com/eulis01/Crypto_Cli"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.1")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "json"
  spec.add_development_dependency "httparty"
  spec.add_development_dependency "terminal-table"
  spec.add_development_dependency "colorize"
  spec.add_development_dependency 'dotenv', '~>2.7.5'
end
