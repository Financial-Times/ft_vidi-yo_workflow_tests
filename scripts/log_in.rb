load('initialise.rb')

USERNAME = 'masteruser'.freeze
PASSWORD = 'masteruser'.freeze

@browser.text_field(id: 'j_username').set USERNAME
@browser.text_field(id: 'j_password').set PASSWORD
@browser.button(id: 'submit_control-button').click
