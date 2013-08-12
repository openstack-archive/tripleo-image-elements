Install components for Neutron network node.

Configuration
-------------

No network-node specific configuration exists. See the
neutron-openvswitch-agent element for configuration parameters.

A typical ovs configuration will set:

    neutron:
      ovs:
        enable_tunneling: 'True'
        public_interface: eth0
        physical_bridge: br-ex
        tenant_network_type: gre
