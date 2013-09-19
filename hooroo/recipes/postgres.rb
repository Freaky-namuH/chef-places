#
# Cookbook Name:: hooroo
# Recipe:: postgres
#
# Copyright 2013, Hooroo
cookbook_file "hba" do
	source "pg_hba.conf"
	owner "postgres"
	group "postgres"
	mode 00644
end
