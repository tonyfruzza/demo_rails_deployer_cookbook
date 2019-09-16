require 'spec_helper'

describe service('puma') do
  it { should be_enabled }
  it { should be_running }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe port(3000) do
  it { should be_listening }
end

describe port(80) do
  it { should be_listening }
end

# Bundler ran
describe file('/srv/rails_demo/vendor/bundle') do
  it { should be_directory }
end
