package 'nginx'

cookbook_file '/etc/nginx/nginx.conf' do
  source 'nginx.conf'
  mode 00600
  notifies :restart, 'service[nginx]', :delayed
end

template '/etc/nginx/conf.d/rails_demo.conf' do
  source 'web.conf.erb'
  mode 00600
  notifies :restart, 'service[nginx]', :delayed
end

service 'nginx' do
  supports stauts: true
  action [ :enable, :start ]
end
