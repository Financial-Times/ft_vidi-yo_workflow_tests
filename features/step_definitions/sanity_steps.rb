When(/^I log in to Mio$/) do
  (visit MioLoginPage).log_in
end

Then(/^I can access editing features$/) do
  expect((on MioLoginPage).visible?).to be_truthy, 'Login failed'
end