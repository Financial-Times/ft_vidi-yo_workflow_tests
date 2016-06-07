# frozen_string_literal: true
When(/^I create a project$/) do
  CreateProjectPage.new(@browser, visit = false).create_project('TEST')
end
