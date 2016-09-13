# frozen_string_literal: true
require 'yaml'
require_relative '../../config/config'

class WSUser

  attr_accessor :username, :password

  include Config::Constants

  def initialize(uname=nil, pwd=nil)
    @username = uname.nil? ? ENVIRONMENT_CONFIG[:admin_user][:username] : uname
    @password = pwd.nil?   ? ENVIRONMENT_CONFIG[:admin_user][:password]  : pwd
  end

end
