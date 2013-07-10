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
        fixed_range: 
	  start: 192.0.2.2
	  end: 192.0.2.3
        ovs_range: 198.51.100.0/24

If public\_interface and physical\_bridge are not set, no bridges will be
connected directly. This is normal for neutron hosting virtual machines
when using an overlay network (e.g. GRE tunnelling). Some of the
other fields will be ignored in this case. Most of them map 1:1 with their
counterparts in the OVS section of ovs\_neutron\_plugin.ini

fixed\_range is used to create an allocation pool on the tenants network, and
ovs\_range is used to create the tenants subnet, if set. If not set the subnet
from the physical\_bridge is used, and the gateway is set to the
physical\_bridge address.
