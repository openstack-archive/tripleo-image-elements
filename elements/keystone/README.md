This element installs the Keystone service from git.

Upon booting the image, the service should be running on port 5000.

Configuration
-------------

Keystone requires the keystone.db key to be set via Heat Metadata.

    keystone:
      db: "mysql://keyuser:keypass@localhost/keystone"


