# Cookbook Name:: hooroo
# Recipe:: postgres
#
# Copyright 2013, Hooroo

# This isn't great, it overwrites the pg_hba.conf with one that allows the
# app servers to talk to the db servers even though the postgres recipe
# manages the pg_hba.conf but doesn't allow it to be enhanced :(
#
include_recipe "postgres"

cookbook_file "#{node['postgresql']['dir']}/pg_hba.conf" do
  owner 'postgres'
  group 'postgres'
  mode '600'
  source 'pg_hba.conf'
end

node[:deploy].each do |application|

  database_details = node[:deploy][application].fetch(:database, false)

  if database_details

    db_database = database_details[:database]
    db_username = database_details[:username]
    db_password = database_details[:password]

    bash "Setup PostgreSQL roles" do
      user "postgres"
      cwd "/tmp"
      code <<-EOH
        psql postgres -c "CREATE ROLE #{db_username} WITH PASSWORD '#{db_password}' LOGIN"
      EOH

      not_if %Q{ test `psql postgres -t --no-align -c "SELECT 1 FROM pg_roles WHERE rolname='#{db_username}'"`x == "1x" }
    end

    bash "Create PostgreSQL databases" do
      user "postgres"
      cwd "/tmp"
      code <<-EOH
        psql postgres -c "CREATE DATABASE #{db_database} OWNER #{db_username}"
      EOH

      not_if %Q{ test `psql postgres -t --no-align -c "SELECT 1 FROM pg_database WHERE datname='#{db_database}'"`x == "1x" }
    end
  end
end
