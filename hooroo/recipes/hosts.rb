template '/etc/hosts' do
  source "hosts.erb"
  mode "0644"
  variables(
    :opsworks => node[:opsworks],
    :hooroo   => node[:hooroo]
  )
end
