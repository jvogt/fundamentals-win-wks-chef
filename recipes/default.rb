#
# Cookbook:: windows-workstation
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

file 'c:/hello.txt' do
  content 'Hello Fundamentals Class!'
  action :create
end