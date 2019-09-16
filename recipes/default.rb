package %w(git ruby24 ruby24-libs ruby24-irb rubygems24 ruby24-devel sqlite-devel)
yumgroup 'Development Tools'
include_recipe "#{cookbook_name}::epll"
package 'nodejs4' do
  options '--enablerepo=epll'
end

%w(ruby2.4 gem2.4 irb2.4).each do |alt|
  alternatives "use #{alt}" do
    link_name alt.split(/[0-9]/).first
    path "/usr/bin/#{alt}"
    priority 100
    action [:install, :set]
  end
end

user node['app']['user'] do
  home "/home/#{node['app']['user']}"
  shell '/bin/bash'
  manage_home true
end

directory node['app']['deploy_dir'] do
  owner node['app']['user']
  group node['app']['user']
end

gem_package 'bundler'

git node['app']['deploy_dir'] do
  repository node['app']['repo_url']
  reference node['app']['repo_branch']
  user node['app']['user']
  group node['app']['user']
  notifies :run, 'rails_prep[init_rails_app]', :immediate
end

rails_prep 'init_rails_app' do
  action :nothing
  notifies :restart, 'service[puma]', :delayed
end

include_recipe "#{cookbook_name}::puma"
include_recipe "#{cookbook_name}::nginx"
