Install components for Neutron network node.

Configuration
-------------

The configuration path neutron.ovs.public\_interface will be added
to br-ex.

  neutron:
    ovs:
      public_interface: eth1

In the example above, eth1 will be added as a port for br-ex.
