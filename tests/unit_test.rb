#!/bin/env ruby
# encoding: utf-8
# frozen_string_literal: true

require 'erb'
require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/retry'
require 'compendium-api'
require 'nretnil-utilities'
require './env' if File.exist?('env.rb')

# Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]
# Minitest::Reporters.use! [Minitest::Reporters::ProgressReporter.new(:color => true)]
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new(color: true)]
Minitest::Retry.use!(
  retry_count: 1,  # The number of times to retry. The default is 3.
  verbose: true,   # Whether or not to display the message at the time of retry. The default is true.
  io: $stdout # Display destination of retry when the message. The default is stdout.
)

# UnitTests
class UnitTests < Minitest::Test
  def setup
    server = ENV['TARGET_URL'] || 'https://app.compendium.com'
    @root = Nretnil::CompendiumAPI::Compendium.new(ENV['CPDM_ROOT_USERNAME'], ENV['CPDM_ROOT_KEY'], server)
    @admin = Nretnil::CompendiumAPI::Compendium.new(ENV['CPDM_ADMIN_USERNAME'], ENV['CPDM_ADMIN_KEY'], server)
    @user = Nretnil::CompendiumAPI::Compendium.new(ENV['CPDM_USER_USERNAME'], ENV['CPDM_USER_KEY'], server)
  end

  def teardown; end
end
