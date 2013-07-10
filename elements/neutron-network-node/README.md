Install components for Neutron network node.

Configuration
-------------

The configuration path neutron.ovs.public\_interface will be added
to br-ex.

  neutron:
    ovs:
      public_interface: eth1

In the example above, eth1 will be added as a port for br-ex.

An external network is configured with details gotten from heat.

  neutron:
    floatingip_range: a.b.c.d/24
    floatingip_start: a.b.c.3
    floatingip_end: a.b.c.54
