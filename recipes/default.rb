#
# Cookbook:: windows-workstation
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

file 'c:/hello.txt' do
  content "Hello Fundamentals Class! Password: " + node['workstation_password']
  action :create
end

%w(googlechrome atom putty git cmder chefdk).each do |p|
  chocolatey_package p
end

directory 'c:/workshop' do
  action :create
end

git 'c:/workshop/zzz-examples' do
  action :sync
  repository 'https://github.com/jvogt/fundamentals-examples'
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
  content "chef_server_url: '#{node['chef_server_url']}
node_name: '#{node['workstation_user']}'
client_key: File.dirname(__FILE__) + '/user.pem'
"