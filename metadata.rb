name             'loganov-collectd'
maintainer       'Loganov Industries, LLC'
maintainer_email 'devops@loganov.com'
license          'All rights reserved'
description      'Installs/Configures loganov-collectd'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

recipe            'loganov-collectd::default', 'Install the collectd agent.'

depends           'build-essential'