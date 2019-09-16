name 'rails_demo'
maintainer 'Onica'
maintainer_email 'support@onica.com'
license 'all_rights'
description 'Installs/Configures server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.0.1'

chef_version '>= 13'

depends 'alternatives', '~> 0.2.0'
depends 'yumgroup', '~> 0.6.0'
