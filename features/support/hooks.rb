browser = Watir::Browser.new


Before do
  @browser = browser
end

at_exit{browser.close}