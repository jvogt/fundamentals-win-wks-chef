#
# Cookbook:: windows-workstation
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

file 'c:/hello.txt' do
  content "Hello Fundamentals Class! Password: " + node['workstation_password']
  action :create
end

directory 'c:/users/administrator/.chef' do
  action :create
  recursive true
end

file 'c:/users/administrator/.chef/user.pem' do
  action :create
  content node['chef_client_key']
end

file 'c:/users/administrator/.chef/config.rb' do
  action :create
  content "chef_server_url '#{node['chef_server_url']}'
node_name '#{node['workstation_user']}'
client_key File.dirname(__FILE__) + '/user.pem'
"
end

directory 'c:/workshop' do
  action :create
end

# note: chocolatey_package no worky on effortless
%w(googlechrome atom putty cmder chefdk).each do |p|
  execute "choco install -y #{p}" do
    action :run
    not_if "if ($(choco list -l -r) -like '*#{p}*') { exit 0 } else { exit 1 }"
    guard_interpreter :powershell_script
  end
end

execute "choco install -y git -params '\"/GitAndUnixToolsOnPath\"'" do
  action :run
  not_if "if ($(choco list -l -r) -like '*git*') { exit 0 } else { exit 1 }"
  guard_interpreter :powershell_script
end

git 'c:/workshop/zzz-examples' do
  action :sync
  repository 'https://github.com/jvogt/fundamentals-examples'
end
