# frozen_string_literal: true
require 'rspec_junit_formatter'
require_relative '../config/config'
require_relative '../lib/string'
require_relative '../vcr_setup'
require 'rspec/wait'

DEFAULT_TIMEOUT = 240

def wait_for_complete(workflow_object)
  start ||= Time.now
    begin

      workflow = workflow_object.retrieve(workflow_object.id)
      info_logger :info, "WFC WF OBJECT: #{workflow.workflow_log}"
      workflow_status = workflow.status
    rescue StandardError => e
      info_logger :info, "FAILED WF OBJECT: #{workflow_object}"
      raise e
    end

    info_logger :info, "Workflow Status: #{workflow_status}"
    info_logger :info, "Elapsed time: #{Time.now - start}"
    if workflow_status =~ /Complete/
      return true
    elsif workflow_status =~ /Failed/
      info_logger :info, "FAILED WF: #{workflow.workflow_log}"
      raise "Workflow #{workflow} failed with #{workflow_status} status"
    else
      sleep 5
      wait_for_complete(workflow_object)
    end
end
