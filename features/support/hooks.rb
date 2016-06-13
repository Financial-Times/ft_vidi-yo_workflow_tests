# frozen_string_literal: true
ENV['SESSION_BROWSER'] ||= 'chrome'
Selenium::WebDriver::Chrome::Service.executable_path = '/Users/Dazzla/src/chromedriver'
# driver = Selenium::WebDriver.for :firefox, marionette: true
browser = Watir::Browser.new ENV['SESSION_BROWSER']

Before do
  @browser = browser
end

After do
  @browser.link(title: 'Logout').click if
    @browser.link(title: 'Logout').present?
end

at_exit do
  browser.close
end
