# Cookbook Name:: hooroo
# Recipe:: setup_fix
#
# Copyright 2013, Hooroo

include_recipe 'deploy'

directory "#{node[:deploy][:deploy_to]}" do
  group node[:deploy][:group]
  owner node[:deploy][:user]
  mode "0775"
  action :create
  recursive true
end
