#
# Cookbook:: agent
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'agent::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '18.04')
      runner.converge(described_recipe)
    end

    it 'creates /home/agent/jenkins directory' do
      expect(chef_run).to create_directory('/home/agent/jenkins')
    end

    it 'creates /home/agent/jenkins/swarm-client-3.15.jar remote_file' do
      expect(chef_run).to create_remote_file('/home/agent/jenkins/swarm-client-3.15.jar')
    end

    it 'creates /etc/systemd/system/jenkinsagent.service template' do
      expect(chef_run).to create_template('/etc/systemd/system/jenkinsagent.service')
    end

    it 'reloads daemon-reload service' do
      expect(chef_run).to reload_service('daemon-reload')
    end

    it 'enables and stars jenkinsagent service' do
      expect(chef_run).to enable_service('jenkinsagent')
      expect(chef_run).to start_service('jenkinsagent')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
