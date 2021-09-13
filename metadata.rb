name 'rails_demo'
maintainer 'Onica'
maintainer_email 'support@onica.com'
license 'all_rights'
description 'Installs/Configures nginx, puma rails server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.0.1'

chef_version '>= 12'
%w(amazon).each do |os|
  supports os
end

depends 'alternatives', '~> 0.2.0'
depends 'yumgroup', '~> 0.6.0'
