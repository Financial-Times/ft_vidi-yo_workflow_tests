require_relative 'create_project'
require_relative 'new_login'

def loop(iterations, sleep)
  fails ||= 0
  begin
    iterations.times do
      log_in
      create_project(sleep)
    end

  rescue Selenium::WebDriver::Error::UnknownError => e
    fails =+ 1
  end

  puts """
  #{fails} / #{iterations} failed
  #{sleep} delay
"""

end

loop 10, 0.4