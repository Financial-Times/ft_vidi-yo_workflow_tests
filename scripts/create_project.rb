# frozen_string_literal: true
require 'watir-webdriver'
Watir.default_timeout = 10

@browser ||= Watir::Browser.new

def log_in
  @browser.goto 'http://localhost:3131/browser'
  @browser.link(href: /logout/).click
  @browser.link(href: /login/).click
  @browser.text_field(id: /Username/).set 'hello'
  @browser.text_field(id: /Password/).set 'hello'
  @browser.div(id: 'handler__login').button.click
end

def select_item(section, value, _sleep=0)
  puts value
  @browser.div(id: Regexp.new(section)).when_present.click
  @browser.span(text: value).when_present.click
  sleep 0.424
end

def create_project(sleep)
  log_in
  @browser.textarea(id: /project/).when_present.value = 'testProject' + rand(9999).to_s
  select_item('Brand', 'AUTH', sleep)
  select_item('Section', 'Life & Arts', sleep)
  @browser.button.when_present.click
  # @browser.link(href: /logout/).when_present.click
end

create_project(5)
