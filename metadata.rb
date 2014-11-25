name             'tempo-priam'
maintainer       'tempo'
maintainer_email 'steve@tempo.ai'
license          'All rights reserved'
description      'Installs/Configures tempo-priam'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.12'


%w{ amazon ubuntu }.each do |os|
  supports os
end

depends "parted"
depends "cassandra-priam"
