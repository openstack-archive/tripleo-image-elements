Install and configure OpenStack Networking Openvswitch agent.

Configuration
-------------

The physical interface and bridges to use to bridge traffic onto can be
configured via Heat Metadata. For example:

    neutron:
      ovs:
        public_interface: vlan25
        public_interface_route: 12.34.56.78
        physical_bridge: br-ctlplane
        network_vlan_ranges: ctlplane
        bridge_mappings: ctlplane:br-ctlplane
    bootstack:
        public_interface_ip: 12.34.56.79/24

If public\_interface and physical\_bridge are not set, no bridges will be
connected directly. This is normal for neutron hosting virtual machines
when using an overlay network (e.g. GRE tunnelling) with no provider networks.
Some of the other fields will be ignored in this case. Most of them map 1:1
with their counterparts in ml2\_conf.ini.

Public\_interface\_ip is used to add an *additional* ip address to the machine.
This is set on the bridge device. Our current scripts write a static
configuration with either DHCP or one IP address per interface, so its not
very flexible.

There are two ways to setup VLANs. The old deprecated way using
public\_interface\_raw\_device creates a VLAN device under the bridge, which
prevents the use of provider networks other than that for the same VLAN. It
also sometimes leads to issues with access to the metadata server. In this
configuration the raw device is still configured using DHCP and the public IP
is put on the bridge device itself using public\_interface\_ip.

The new way is to use public\_interface\_tag and public\_interface\_tag\_ip to
create a VLAN access port on top of the bridge. This allows the use of any
provider network desired, as the traffic tagging and filtering occurs in the
bridge rather than below it. In this configuration the access port is given the
public IP address, the bridge is (usually) configured for DHCP, and the
underlying device is no longer given an IP address at all. This can be used
together with public\_interface\_ip to assign a static ip address to the bridge
(which we use for the seed VM as part of bootstrapping an environment).

Routing on the control plane network can be complex, and we have a new feature
coming in to do arbitrary routes, but for now, we offer the ability to add a
single static route via the physical\_bridge\_route key.

For instance:

    neutron:
      ovs:
        public_interface: eth2
        public_interface_route: 45.67.89.1
        public_interface_tag: 25
        public_interface_tag_ip: 45.67.89.10/24
        physical_bridge: br-ctlplane
        physical_bridge_route:
          prefix: 12.34.0.0/16
          via: 12.34.56.1
    bootstack:
        public_interface_ip: 12.34.56.79/24

will result in br-ctlplane being created on eth2, a tagged port (`int\_public`)
added to br-ctlplane with tag 25, ip address 45.67.89.10/24, default route
45.67.89.1 and the bridge device itself being assigned 12.34.56.78/24.

public\_interface\_tag must be an int, or null, which like not present, means
untagged. When public\_interface\_tag is not set, public\_interface\_tag\_ip
must also not be set. The recommended approach is to set the tag, tag\_ip and
\_route options together, or not at all. public\_interface\_ip should only be
used in the seed, as using it elsewhere will usually result in the metadata
service being inaccessible.

For the deprecated behaviour where public\_interface\_raw\_device is set,
public\_interface must be a vlan device, and the vlan device will be created
using the raw device during os-collect-config configuration. We suggest not
using this and migrating to public\_interface\_ip\_tag as soon as possible as
that will fix tag provider networks.

When public\_interface\_raw\_device is not set, setting an IP address without
setting a tag for it will result in an invalid configuration where metadata
access is not possible, as the source IP address will be wrong. This may be
useful where metadata access is not an issue (such as the seed VM).

The bridge is always configured to use the MAC address of the public\_interface
device as its MAC address.

Once the bridge and access port (if configured) are set up, the
public\_interface\_route (if set) will replace the default route's next hop.
The hop this replaces will be added as the next hop for 169.254.169.254/32
(unless one already exists). This permits routing default traffic out through
a hardware router without breaking the ability to contact a local subnet bare
metal metadata server.
