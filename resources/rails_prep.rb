resource_name :rails_prep
default_action :run

action :run do
  node['app']['app_initializers'].each do |cmd|
    execute cmd do
      environment PATH: "#{ENV['PATH']}:/usr/local/bin"
      cwd node['app']['deploy_dir']
      user node['app']['user']
      group node['app']['user']
      command cmd
    end
  end
end
