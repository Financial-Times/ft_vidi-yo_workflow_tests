# frozen_string_literal: true
# Params solution is temporary: login page will be separate in the final rendered panels

When(/^I log in(?: to the browser panel)?$/) do
  visit FTLoginPage, using_params: {panel: 'browser'}, &:log_in
end

When(/^I log in to the prelude panel$/) do
  visit FTLoginPage, using_params: {panel: 'prelude'}, &:log_in
end

When(/^I log in to the premiere panel$/) do
  visit FTLoginPage, using_params: {panel: 'premiere'}, &:log_in
end
