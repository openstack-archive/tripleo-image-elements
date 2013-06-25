This element installs the Keystone service from git.

Upon booting the image, the service should be running on port 5000.

Configuration
-------------

Keystone requires the keystone.db key to be set via Heat Metadata.

    keystone:
      db: "mysql://keyuser:keypass@localhost/keystone"


NOTE: Token cleanup will cause poor performance until the upstream
bug (https://bugs.launchpad.net/keystone/+bug/1188378) is fixed. This
problem is fixed in some distributions (Ubuntu, RHEL, CentOS) where
percona-toolkit's is supported and used to clean out the table on mysql.
http://www.percona.com/mysql-support/policies/percona-toolkit-supported-platforms-and-versions
