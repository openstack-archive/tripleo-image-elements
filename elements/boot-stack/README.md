A self-contained one-node baremetal openstack.

Description
-----------

This element contains nova, glance, and keystone services, configured to perform baremetal deployments.


Basic Usage
-----------

See this doc for basic usage instructions:
  https://github.com/tripleo/incubator/blob/master/notes.md


First Boot
----------

Upon first boot, scripts will be automatically run to perform the following:
- database initialization
- service restarts
- default keystone accounts
- default nova flavors/images
- default network configuration.

The output of the first-boot scripts can be viewed in `/var/log/first-boot.d.log`.
The file `/opt/stack/boot-stack/boot-stack.ok` will be touched upon the scripts' completion.


Credentials
-----------

OpenStack credentials are installed to /root/stackrc in the boot-stack machine.
All services listen on a wildcard address, so that the credentials may be copied out and used from outside the boot-stack machine.


Utilities
---------

The following utilities are available in the running boot-stack machine:

`wipe-openstack` - Clear all openstack databases, and return nova/keystone/quantum/etc. to their default states.

`boot-stack-logs` - Start a screen session which tails important logs.
