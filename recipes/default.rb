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


node[:deploy].each do |application, deploy|
  rails_env = deploy[:rails_env]
  current_path = deploy[:current_path]

  Chef::Log.info("Precompiling Rails assets with environment #{rails_env}")

  execute 'rake assets:precompile' do
    cwd current_path
    user 'deploy'
    command 'bundle exec rake assets:precompile'
    environment 'RAILS_ENV' => rails_env
  end
end