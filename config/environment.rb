# frozen_string_literal: true

require 'open-uri'
require 'net/http'
require 'bundler/setup'
Bundler.require(:default, :development)
Dotenv.load
# the order of these file is important
require_relative '../lib/crypto_cli/api.rb'
require_relative '../lib/crypto_cli/ticker.rb'
require_relative '../lib/crypto_cli/cli.rb'
