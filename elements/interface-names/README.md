interface-names
===============

net.ifnames may be 0 in /etc/default/grub which can make generating a
configuration for the network interfaces difficult. The default in RHEL7
was to not have this defined. The kernel args can be tuned later in the
deployment so we want to clean it out if it is defined in grub.
