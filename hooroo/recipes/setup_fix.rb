# Cookbook Name:: hooroo
# Recipe:: setup_fix
#
# Copyright 2013, Hooroo

include_recipe 'deploy'

directory "#{deploy[:deploy_to]}" do
  group deploy[:group]
  owner deploy[:user]
  mode "0775"
  action :create
  recursive true
end
