Install and configure Keystone.

Upon booting the image, the service should be running on port 5000.

Configuration
-------------

Default template for /etc/keystone/keystone.conf file contains minimal set of
configuration parameters, which are expected to be passed in with Heat Metadata.
For example, keystone.db key is required to provide MySQL connection string:

```
keystone:
  db: "mysql://keyuser:keypass@localhost/keystone"
```

All customizations to _/etc/keystone/keystone.conf_ are expected to be done using
[passthrough configuration feature](https://blueprints.launchpad.net/tripleo/+spec/passthrough-config).

Additional configuration file _/etc/keystone/domains/keystone.ldap.conf_ is also
maintained to provide
[domain-specific configuration](http://docs.openstack.org/trunk/config-reference/content/section_keystone-domain-configs.html)
for LDAP. This file is also populated using
[passthrough configuration feature](https://blueprints.launchpad.net/tripleo/+spec/passthrough-config)
with "keystone_ldap" key. Here is a sample content for ExtraConfig Heat Metadata
parameter:

```
{
    "keystone": {
        "config": [
            {
                "section": "identity",
                "values": [
                    {
                        "option": "domain_specific_drivers_enabled",
                        "value": "True"
                    },
                    {
                        "option": "domain_config_dir",
                        "value": "/etc/keystone/domains"
                    }
                ]
            }
        ]
    },
    "keystone_ldap": {
        "config": [
            {
                "section": "identity",
                "values": [
                    {
                        "option": "driver",
                        "value": "keystone.identity.backends.ldap.Identity"
                    }
                ]
            },
            {
                "section": "assignment",
                "values": [
                    {
                        "option": "driver",
                        "value": "keystone.assignment.backends.sql.Assignment"
                    }
                ]
            },
            {
                "section": "ldap",
                "values": [
                    {
                        "option": "url",
                        "value": "ldap://ldap.example.com"
                    },
                    {
                        "option": "suffix",
                        "value": "dc=example,dc=com"
                    },
                    . . .
                ]
            }
        ]
    }
}
```

NOTE: Token cleanup will cause poor performance until the upstream
bug (https://bugs.launchpad.net/keystone/+bug/1188378) is fixed. This
problem is fixed in some distributions (Ubuntu, RHEL, CentOS) where
percona-toolkit's is supported and used to clean out the table on mysql.
http://www.percona.com/mysql-support/policies/percona-toolkit-supported-platforms-and-versions
