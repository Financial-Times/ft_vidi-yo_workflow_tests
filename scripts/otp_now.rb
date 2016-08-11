#Copies current OTP code to clipboard. Requires >= ruby 2.3.1
require 'rotp'
OT ||= ROTP::TOTP.new(ENV['MIO_APP_KEY'])
puts OT.now

def copy_to_clipboard(content)
  str = content.to_s
  IO.popen('pbcopy', 'w') { |f| f << str }
  str
end

def paste_from_clipboard
  `pbpaste`
end

copy_to_clipboard(OT.now)