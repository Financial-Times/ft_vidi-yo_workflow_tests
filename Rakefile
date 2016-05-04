require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'yaml'

sys_config = YAML.load_file(File.join(File.dirname(__FILE__), 'config/config.yml'))


def exclude_inactive_tags
  '--tags ~@wip'
end

Cucumber::Rake::Task.new(:default, 'All completed features') do |t|
  t.cucumber_opts = "#{exclude_inactive_tags}"
  t.profile = 'html_report'
end
