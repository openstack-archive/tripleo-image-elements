Install and configure OpenStack Networking Openvswitch agent.

Configuration
-------------

The physical interface and bridges to use to bridge traffic onto can be
configured via Heat Metadata. For example:

    neutron:
      ovs:
        public_interface: eth2
        physical_bridge: br-ctlplane
        physical_network: ctlplane
        network_vlan_ranges: ctlplane
        bridge_mappings: ctlplane:br-ctlplane

If public\_interface and physical\_bridge are not set, no bridges will be
connected directly. This is normal for neutron hosting virtual machines
when using an overlay network (e.g. GRE tunnelling). Some of the
other fields will be ignored in this case. Most of them map 1:1 with their
counterparts in the OVS section of ovs\_neutron\_plugin.ini
