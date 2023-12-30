# frozen_string_literal: true

if ENV['coverage'] == 'on'
  require 'simplecov'

  class LineFilter < SimpleCov::Filter
    def matches?(source_file)
      source_file.lines.count < filter_argument
    end
  end

  SimpleCov.start 'rails' do
    minimum_coverage 100
    add_filter [LineFilter.new(11)]
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.order = :random
  Kernel.srand config.seed
end
