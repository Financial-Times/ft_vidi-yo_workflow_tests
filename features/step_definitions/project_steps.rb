# frozen_string_literal: true
When(/^I create a project$/) do
  ProjectPage.new(@browser, visit = false).create_project('TEST')
end
