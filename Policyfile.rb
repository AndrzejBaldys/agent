# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'agent'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'git::default',
         'openjdk8::default',
         'mvn::default',
         'agent::default'

# Specify a custom source for a single cookbook:
cookbook 'agent', path: '.'

cookbook 'git', git: 'https://github.com/AndrzejBaldys/git.git'
cookbook 'openjdk8', git: 'https://github.com/AndrzejBaldys/openjdk8.git'
cookbook 'mvn', git: 'https://github.com/AndrzejBaldys/mvn.git'
