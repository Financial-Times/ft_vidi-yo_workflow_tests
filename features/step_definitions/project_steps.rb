# frozen_string_literal: true
When(/^I create a project$/) do
  visit FTLoginPage, using_params: {panel: 'browser'}, &:log_in
  (on ProjectPage).create_project('12345')
end

When(/^I create a project with invalid values$/) do
  visit FTLoginPage, using_params: {panel: 'browser'}, &:log_in
  (on ProjectPage).create_project('1234')
  true

end
