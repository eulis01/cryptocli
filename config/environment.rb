

require 'bundler/setup'
Bundler.require(:default, :development)
Dotenv.load

require_relative '../lib/ticker.rb'
require_relative '../lib/crypto_cli/cli.rb'