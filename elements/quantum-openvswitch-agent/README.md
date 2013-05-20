Install and configure OpenStack Networking Openvswitch agent.

Configuration
-------------

The physical interface to bridge traffic onto must be configured via
Heat Metadata. For example:

    quantum:
      ovs:
        public_interface: eth2
