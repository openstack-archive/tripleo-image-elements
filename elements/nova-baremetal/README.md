Nova baremetal services
-----------------------

Configures the nova-baremetal directories on disk and restarts the baremetal
dnsmasq and helper services in os-refresh-config.

Installs a filter-bootps cronjob. filter-bootps adds an iptables filter to the
br-ctlplane bridge interface, ensuring that only bootps requests from nodes
registered with nova baremetal are received by services running in the image.
This prevents the seed node from trying to PXE boot overcloud nodes (rather
than the undercloud node doing so).

An iptables rule to capture incoming EC2 metadata API requests and redirect
them to the nova API is automatically added to the neutron.ovs.physical\_bridge
interface. See the neutron-openvswitch-agent for the full set of ovs parameters.
For example:

    neutron:
      ovs:
        physical_bridge: br-ctlplane

In the future we may create a dedicated parameter to permit nova-baremetal to
run separately from the neutron agents in the undercloud.
