require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'yaml'
require 'watir-webdriver'
require 'rake/testtask'

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
