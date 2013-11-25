# Cookbook Name:: hooroo
# Recipe:: setup_fix
#
# Copyright 2013, Hooroo

directory "#{deploy[:deploy_to]}" do
  group deploy[:group]
  owner deploy[:user]
  mode "0775"
  action :create
  recursive true
end
