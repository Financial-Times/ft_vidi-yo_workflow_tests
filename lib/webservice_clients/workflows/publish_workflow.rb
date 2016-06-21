require_relative '../../../lib/webservice_clients/workflow_clients/publish_workflow_webservice_client'


class PublishWorkflow

  attr_reader :workflow_log

  def create
    @workflow_log = PublishWorkflowWebserviceClient.new.create_publish_workflow
    self
  end

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

end