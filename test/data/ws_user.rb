# frozen_string_literal: true
require 'yaml'
require_relative '../../config/config'

class WSUser

  include Config::Constants

  attr_accessor :username, :password

  def initialize(uname=nil, pwd=nil)
    @username = uname.nil? ? ENV['MIO_WS_USERNAME'] : uname
    @password = pwd.nil? ? ENV['MIO_WS_PASSWORD'] : pwd
  end

end
