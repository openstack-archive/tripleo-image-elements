Install and configure OpenStack Networking Openvswitch agent.

Configuration
-------------

The physical interface and bridges to use to bridge traffic onto can be
configured via Heat Metadata. For example:

    neutron:
      ovs:
        public_interface: vlan25
        public_interface_raw_device: eth2
        public_interface_route: 12.34.56.78
        physical_bridge: br-ctlplane
        physical_network: ctlplane
        network_vlan_ranges: ctlplane
        bridge_mappings: ctlplane:br-ctlplane

If public\_interface and physical\_bridge are not set, no bridges will be
connected directly. This is normal for neutron hosting virtual machines
when using an overlay network (e.g. GRE tunnelling). Some of the
other fields will be ignored in this case. Most of them map 1:1 with their
counterparts in the OVS section of ovs\_neutron\_plugin.ini If
public\_interface\_raw\_device is set, public\_interface must be a vlan device,
and the vlan device will be created using the raw device during
os-collect-config configuration.

Once the public interface is configured, public\_interface\_route (if set)
will replace the default route's next hop. The hop this replaces will be
added as the next hop for 169.254.169.254/32 (unless one already exists).
This permits routing default traffic out through a hardware router without
breaking the ability to contact a bare metal metadata server.
