# frozen_string_literal: true

require_relative '../config/config'
require_relative '../lib/string'
require_relative '../vcr_setup'
require 'rspec/wait'

DEFAULT_TIMEOUT = 240

def wait_for_complete(workflow_object, stored_workflow)
  start ||= Time.now
  wait_for do
    begin
      workflow_status = workflow_object.retrieve(stored_workflow.id).status
    rescue StandardError => e
      raise e
    end

    info_logger :info, workflow_status
    info_logger :info, "Elapsed time: #{Time.now - start}"
    if workflow_status =~ /Complete/
      return workflow_status
    elsif workflow_status =~ /Failed/
      raise "Workflow #{stored_workflow} failed with #{workflow_status} status"
    else
      sleep 5
      workflow_status
    end
  end
    .to match(/Complete/)
end
