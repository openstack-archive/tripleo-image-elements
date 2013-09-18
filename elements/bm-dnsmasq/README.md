Non-PXE Neutron DHCP workaround
-------------------------------

Separate pool based dnsmasq to workaround old Neutron not supporting PXE
booting, which is restarted during os-refresh-config.

Installs a filter-bootps cronjob. filter-bootps adds an iptables filter to the
br-ctlplane bridge interface, ensuring that only bootps requests from nodes
registered with nova baremetal are received by services running in the image.
This prevents the seed node from trying to PXE boot overcloud nodes (rather
than the undercloud node doing so).

