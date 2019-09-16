template '/etc/init.d/puma' do
  source 'puma.erb'
  mode 00755
  notifies :restart, 'service[puma]', :delayed
end

template "#{node['app']['deploy_dir']}/config/puma.rb" do
  source 'puma.rb.erb'
  mode 00644
  notifies :restart, 'service[puma]', :delayed
end

service 'puma' do
  supports status: true
  action [ :enable, :start ]
end
