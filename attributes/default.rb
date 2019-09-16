default['app'] = {
  repo_url: 'https://github.com/tonyfruzza/rails_demo.git',
  repo_branch: 'master',
  user: 'apprunner',
  env: 'development',
  deploy_dir: '/srv/rails_demo',
  app_initializers: [
    'bundle install --path vendor/bundle --jobs=4 --without development test',
    'bundle exec rake db:migrate',
    'bundle exec rake assets:precompile'
  ]
}

default['puma'] = {
  threads_min: 1,
  threads_max: 4,
  sock_name: '/tmp/puma.sock'
}
