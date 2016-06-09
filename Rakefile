# frozen_string_literal: true
require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'yaml'
require 'watir-webdriver'
require 'rake/testtask'
require 'rspec/core/rake_task'
gem 'ci_reporter'
require 'ci/reporter/rake/test_unit'

def exclude_inactive_tags
  '--tags ~@wip'
end

Cucumber::Rake::Task.new(:default, 'All completed features') do |t|
  t.cucumber_opts = exclude_inactive_tags
  t.profile = 'html_report'
end

Cucumber::Rake::Task.new(:example, 'Example features') do |t|
  t.cucumber_opts = exclude_inactive_tags
  t.profile = 'example'
end

Rake::TestTask.new(:unit_tests) do |t|
  t.verbose = false
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
end

Rake::TestTask.new do |t|
  t.libs << 'spec'
  t.name = 'integration_tests'
  t.warning = true
  t.test_files = FileList['spec/*_spec.rb']
end
