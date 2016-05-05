browser = Watir::Browser.new

Before do
  ROOT_URL = 'https://ftdemo.dev.nativ-systems.com/'
  @browser = browser
end

at_exit {browser.close}