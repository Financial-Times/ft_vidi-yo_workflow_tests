When(/^I log in to Mio$/) do
  (visit MioLoginPage).log_in
  expect((on MioDashboard).displayed?).to be_truthy, 'Login failed'
end

When(/^I can access (\w+) features$/) do |section|
  expect((on MioDashboard).change_section(section)).to be_truthy,
     "Failed to change to section #{section}"
end
