require 'yaml'

class WSUser

  attr_accessor :username, :password



  def initialize(uname=nil, pwd = nil)
    @local_user_credentials = YAML.load_file('config/secrets.yml')
    @username = uname.nil? ? @local_user_credentials[:username] : uname
    @password = pwd.nil? ? @local_user_credentials[:username] : pwd
  end

end