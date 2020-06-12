# frozen_string_literal: true

# require is use to call a load path or a gem
require 'open-uri'
require 'net/http'
require 'bundler/setup'
Bundler.require(:default, :development)
Dotenv.load

# the order of these file is important
# require_relative is use to require file in path

require_relative '../lib/crypto_cli/cli.rb'
require_relative '../lib/crypto_cli/api.rb'
require_relative '../lib/crypto_cli/ticker.rb'
