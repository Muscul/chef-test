#
# Cookbook Name:: vj
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "install libmysqlclient" do
  command "sudo apt-get install libmysql-ruby libmysqlclient-dev"
end