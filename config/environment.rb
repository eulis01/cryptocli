# frozen_string_literal: true

require 'bundler/setup'
Bundler.require(:default, :development)
Dotenv.load

require_relative '../lib/api.rb'
require_relative '../lib/crypto_cli/cli.rb'
