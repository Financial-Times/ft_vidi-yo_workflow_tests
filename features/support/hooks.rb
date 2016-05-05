browser = Watir::Browser.new

ROOT_URL = 'https://ftdemo.dev.nativ-systems.com/'

Before do
  @browser = browser
end

at_exit{browser.close}