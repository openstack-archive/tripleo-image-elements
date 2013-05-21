Install and configure OpenStack Networking Openvswitch agent.

Configuration
-------------

The physical interface and bridges to use to bridge traffic onto can be
configured via Heat Metadata. For example:

    quantum:
      ovs:
        public_interface: eth2
        physical_bridge: br-ctlplane
        physical_network: ctlplane
        network_vlan_ranges: ctlplane
        bridge_mappings: ctlplane:br-ctlplane
        fixed_range: 192.0.2.32/29
        ovs_range: 192.0.2.0/24

If public\_interface and physical\_bridge are not set, no bridges will be
connected directly. This is normal for quantum hosting virtual machines
as the l3 agent is responsible for making this connection. Some of the
other fields will be ignored in this case. Most of them map 1:1 with their
counterparts in the OVS section of ovs\_quantum\_plugin.ini
