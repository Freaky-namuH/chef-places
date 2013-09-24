#
# Cookbook Name:: hooroo
# Recipe:: buildagent 
#
# Copyright 2013, Hooroo

package "unzip" do
  action :install
end

remote_file "/tmp/chromedriver.zip" do
  owner "root"
  group "root"
  mode 00644
  source "https://chromedriver.googlecode.com/files/chromedriver_linux64_2.2.zip"
  checksum "c737452bacba963a36d32b3bc0fdb87cb6cb25a6"
end

directory "/opt/bin" do
	owner "root"
	group "root"
	recursive true
	mode 00755
end
#apt get install libgconf-dev
#need to fix symlink existing stopping unzip
bash "unzip chromedriver" do
	user "root"
	cwd "/tmp"
	not_if "test -L /opt/bin/chromedriver"
	code <<-EOH
	unzip chromedriver.zip -d /opt/bin/	
	EOH
end

link "/opt/bin/chromedriver" do
	to "/usr/bin/google-chrome"
end

bash "sudojenkins" do
	user "root"
	cwd "/tmp"
	ignore_failure true
	code <<-EOH
		gpasswd -a jenkins admin	
	EOH
end
