require 'yaml'

class WSUser

  attr_accessor :username, :password

  def initialize(uname=nil, pwd = nil)
    secrets_file = File.join(File.dirname(__FILE__), 'secrets.yml')
    @local_user_credentials = YAML.load_file(secrets_file)

    @username = uname.nil? ? @local_user_credentials[:username] : uname
    @password = pwd.nil? ? @local_user_credentials[:username] : pwd
  end

end