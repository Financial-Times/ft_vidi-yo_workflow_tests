# frozen_string_literal: true
require_relative '../spec_helper'
require_relative '../../config/config'
require_relative '../../lib/webservice_clients/workflows/end_to_end_workflow'
require 'rspec/wait'

RSpec.describe MetadataDescriptionWebserviceClient do
  include Config::Logging

  context 'live integration testing' do
    it 'can retrieve metadata' do
      metadata = MetadataDescriptionWebserviceClient.new.retrieve_description_metadata
      expect(metadata).to respond_to :each
    end

  end

end