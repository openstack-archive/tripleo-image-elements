A self-contained one-node openstack.

Description
-----------

This element contains nova, glance, and keystone services.

When building an image containing boot-stack be sure to add either nova-kvm or
nova-baremetal to enabled the appropriate hypervisor.

The seed-stack-config element can be used to configure boot-stack in the
absence of Heat.


Basic Usage
-----------

See this doc for basic usage instructions:
  http://docs.openstack.org/developer/tripleo-incubator/devtest.html


Credentials
-----------

OpenStack credentials are installed to /root/stackrc in the boot-stack machine,
for automation needing them w/in the instance. Credentials are set from
metadata, so consult config.json or your heat parameters.


Utilities
---------

The following utilities are available in the running boot-stack machine:

`reset-db` - Clear all openstack databases.

`boot-stack-logs` - Start a screen session which tails important logs.


Configuration
-------------

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

Some configuration is tied into the neutron-openvswitch-agent - see the
README.md there as well.
