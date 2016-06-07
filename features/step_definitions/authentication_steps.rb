# Params solution is temporary: login page will be separate in the final rendered panels

When(/^I log in(?: to the browser panel)?$/) do
  visit FTLoginPage, using_params: {panel: 'browser'} do |page|
    page.log_in
  end
end

When(/^I log in to the prelude panel$/) do
  visit FTLoginPage, using_params: {panel: 'prelude'} do |page|
    page.log_in
  end
end