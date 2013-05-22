Install components for Quantum network node.

Configuration
-------------

The configuration path quantum.ovs.public\_interface will be added
to br-ex.

  quantum:
    ovs:
      public_interface: eth1

In the example above, eth1 will be added as a port for br-ex.
