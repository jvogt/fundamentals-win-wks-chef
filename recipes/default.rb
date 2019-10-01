#
# Cookbook:: windows-workstation
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
# user 'administrator' do
#   password node['workstation_password']
#   action :modify
# end

file 'c:/hello.txt' do
  content "Hello Fundamentals Class!"
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

file 'c:/users/administrator/.gitconfig' do
  action :create
  content "[user]
email = you@example.com
name = Your Name
"
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

directory 'c:/workshop/cookbooks' do
  action :create
end

directory 'c:/workshop/policyfiles' do
  action :create
end


git 'c:/workshop/zzz-examples' do
  action :sync
  repository 'https://github.com/jvogt/fundamentals-examples'
end
