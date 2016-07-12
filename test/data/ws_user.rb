# frozen_string_literal: true
require 'yaml'
require_relative '../../config/config'

class WSUser

  include Config::Constants

  attr_accessor :username, :password

  def initialize(uname=nil, pwd=nil)
    @username = uname.nil? ? SECRETS[:username] : uname
    @password = pwd.nil? ? SECRETS[:password] : pwd
  end

end
