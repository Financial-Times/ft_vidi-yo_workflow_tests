# frozen_string_literal: true
require 'watir-webdriver'
Watir.default_timeout = 5

@browser ||= Watir::Browser.new

def log_in
  @browser.goto 'http://localhost:3131/browser'
  @browser.link(href: /logout/).when_present.click
  @browser.link(href: /login/).when_present.click
  @browser.text_field(id: /Username/).set 'hello'
  @browser.text_field(id: /Password/).set 'hello'
  @browser.div(id: 'handler__login').button.click
  sleep 1
end
