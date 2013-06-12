A self-contained one-node baremetal openstack.

Description
-----------

This element contains nova, glance, and keystone services, configured to perform baremetal deployments.


Basic Usage
-----------

See this doc for basic usage instructions:
  https://github.com/tripleo/incubator/blob/master/devtest.md


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


Configuration
-------------

Unlike other elements, boot-stack includes a full copy of the Heat
Metadata in its root directory, called config.json. This is necessary
so that boot-stack can be the bootstrap for a fully working OpenStack,
including Heat.

The various elements listed in element-deps have their own configurations,
though boot-stack includes its own.

For setting up keystone, `controller-address` can be set to an explicit
address that will be used to control the endpoints for the initial
cloud. If it is not set, the default is to try and determine the address
from the default network interface configuration.

Here is an example of its usage in Heat Metadata:

    controller-address:
      Fn::GetAtt: [ ControllerResource, PublicIp ]

Note that if you are feeding this Metadata to ControllerResource it
will not be fed into the process until the Heat Metadata is refreshed,
since the initial Metadata copy will have '0.0.0.0' (as we don't know
the address until after we create a server record).


For setting up the list of elements to include in the ramdisk must be configured as a space separated list of elements.
For example:

    dib:
      ramdisk_elements: "deploy mellanox"

Build Options
-------------

To change build defaults for the boot-stack machine edit the config.json file before building.

baremetal:
  virtual_power:
    - type: virsh or vbox
