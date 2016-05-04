When(/^I run the example feature$/) do
  $stdout.puts 'Hello, World!'
end

Then(/^I know the test set is running without error$/) do
  true
end

When(/^I run a tagged scenario$/) do
  $stdout.puts 'Hello, Tags!'
end
