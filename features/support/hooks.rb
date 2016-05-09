browser = Watir::Browser.new $browser


Before do
  @browser = browser
end

After do
  @browser.link(title: 'Logout').click if @browser.link(title: 'Logout').present?
end

at_exit do
  browser.close
end