# Extra Packages for Enterprise Linux 6

script 'epll_rpm_download' do
  interpreter 'bash'
  cwd '/tmp'
  code 'curl -X GET -o RPM-GPG-KEY-lambda-epll https://lambda-linux.io/RPM-GPG-KEY-lambda-epll'
  not_if {`yum repolist disabled`.each_line.find{|line| /^epll-preview/ =~ line} != nil}
  notifies :run, 'script[epll_rpm_import]', :immediately
end

script 'epll_rpm_import' do
  interpreter 'bash'
  cwd '/tmp'
  code 'rpm --import RPM-GPG-KEY-lambda-epll'
  action :nothing
  notifies :run, 'script[epll_package_list_download]', :immediately
end

script 'epll_package_list_download' do
  interpreter 'bash'
  cwd '/tmp'
  code 'curl -X GET -o epll-release-2016.09-1.2.ll1.noarch.rpm https://lambda-linux.io/epll-release-2016.09-1.2.ll1.noarch.rpm'
  action :nothing
  notifies :run, 'script[epll_package_list_add]', :immediately
end

script 'epll_package_list_add' do
  interpreter 'bash'
  cwd '/tmp'
  code 'yum -y install epll-release-2016.09-1.2.ll1.noarch.rpm'
  action :nothing
end
