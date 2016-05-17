require 'watir-webdriver'
ENV['SESSION_BROWSER'] = 'firefox'
@browser = ENV['SESSION_BROWSER']
@browser = Watir::Browser.new @browser
@browser.goto 'https://master.dev.nativ-systems.com/'