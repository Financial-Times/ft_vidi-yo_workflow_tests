require_relative '../../../config/config'

class Workflow

  include Config::Logging

  def created?
    puts "Status: #{status}"
    status == 'Running' || status =~ /Complete/
  end

  def status
    @workflow_log['status']
  end

  def id
    @workflow_log['id']
  end

  ##
  # Check the status - workflow started?
  #
  # @return [boolean]
  def started?
    status == 'Running' || status =~  /Complete/
  end


end