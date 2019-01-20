#
# Cookbook:: agent
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

version     = node['jenkins_agent']['version']
suorce_path = "https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/#{version}"
source_file = "swarm-client-#{version}.jar"
dest_dir    = node['jenkins_agent']['working_directory']

directory dest_dir

remote_file "#{dest_dir}/#{source_file}" do
  source "#{suorce_path}/#{source_file}"
end

template '/etc/systemd/system/jenkinsagent.service' do
  source 'jenkinsagent.service.erb'
  owner 'root'
  group 'root'
  mode '0777'
end

service 'daemon-reload' do
  action :reload
end

service 'jenkinsagent' do
  action [ :enable, :start ]
end
