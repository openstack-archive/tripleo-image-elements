Nova baremetal services
-----------------------

Configures the nova-baremetal directories on disk and restarts the deploy
helper service in os-refresh-config.

An iptables rule to capture incoming EC2 metadata API requests and redirect
them to the nova API is automatically added to the neutron.ovs.physical\_bridge
interface. See the neutron-openvswitch-agent for the full set of ovs parameters.
For example:

    neutron:
      ovs:
        physical_bridge: br-ctlplane

In the future we may create a dedicated parameter to permit nova-baremetal to
run separately from the neutron agents in the undercloud.
