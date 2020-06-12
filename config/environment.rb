# frozen_string_literal: true

require 'open-uri'
require 'net/http'
require 'bundler/setup'
Bundler.require(:default, :development)
Dotenv.load

require_relative '../lib/crypto_cli/api.rb'
require_relative '../lib/crypto_cli/cli.rb'
