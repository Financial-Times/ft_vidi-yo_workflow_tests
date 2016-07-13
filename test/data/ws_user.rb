# frozen_string_literal: true
require 'yaml'

class WSUser

  attr_accessor :username, :password

  def initialize(uname=nil, pwd=nil)
    @username = uname.nil? ? ENV['MIO_WS_USERNAME'] : uname
    @password = pwd.nil? ?   ENV['MIO_WS_PASSWORD'] : pwd
    puts "U: #{@username[1, 4]}"
    puts "P: #{@password[1, 4]}"
  end

end
