require 'resolv'

if node[:hooroo] && node[:hooroo][:postgres] && node[:hooroo][:postgres][:database_master]
  node[:hooroo][:postgres][:database_master_ip_address] = Resolv.getaddress(node[:hooroo][:postgres][:database_master])
end
