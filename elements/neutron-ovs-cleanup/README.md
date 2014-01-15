Install and configure OpenStack Networking cleanup utility.

We use this utility to cleanup all OVS ports on reboot. This helps fix
a race condition where DHCP on reboot fails due to the fact that
Openvswitch starts after networking on most distros.

Currently supports systemd distributions only.
