# Inspec test for recipe agent::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe user('root') do
  it { should exist }
end

describe user('agent') do
  it { should exist }
end

describe port(22) do
  it { should be_listening }
end

describe port(80) do
  it { should be_listening }
end

describe port(443) do
  it { should be_listening }
end

describe directory('/home/agent/jenkins') do
  it { should exist }
  it { should be_directory }
end

describe file('/home/agent/jenkins/swarm-client-3.15.jar') do
  it { should exist }
end

describe file('/etc/systemd/system/jenkinsagent.service') do
  it { should exist }
end

describe service('jenkinsagent') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
