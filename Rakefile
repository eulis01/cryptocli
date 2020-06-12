# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require_relative 'config/environment'
require 'dotenv/tasks'

task mytask: :dotenv do
  # things that require .env
end

RSpec::Core::RakeTask.new(:spec)

task default: :spec
task :console do
  def reload!
    load './lib/Crypto_Cli.rb'
    load './lib/Crypto_Cli/api.rb'
    load './lib/Cryto_Cli/cli.rb
    load './lib/Cryto_Cli/ticker'
  end
  Pry.start
end
