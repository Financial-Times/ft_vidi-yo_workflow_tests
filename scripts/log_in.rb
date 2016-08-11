# frozen_string_literal: true
load('initialise.rb')

@browser.text_field(id: 'j_username').set USERNAME
@browser.text_field(id: 'j_password').set PASSWORD
@browser.button(id: 'submit_control-button').click
