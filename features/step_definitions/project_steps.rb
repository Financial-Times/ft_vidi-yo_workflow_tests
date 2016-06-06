When(/^I create a project$/) do
  (visit FTLoginPage).log_in
  CreateProjectPage.new(@browser, visit=false).create_project('TEST')
end