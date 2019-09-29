#
# Cookbook:: windows-workstation
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

file 'c:/hello.txt' do
  content 'Hello Fundamentals Class!'
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
