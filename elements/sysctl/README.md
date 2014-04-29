Manages sysctl settings.

Two ways to make use of this element:

1) Elements can make use of sysctl-set-value directly by requiring
this element and calling /usr/local/bin/sysctl-set-value. This will
help ensure conflicting sysctl values are not in use across elements.

2) Alternately you can make use of the element via Heat by adding
metadata in the configuration example below. The sysctl-set-data
binary will take care of applying these settings during
configuration time.

Configuration example
---------------------
sysctl:
    net.ipv4.conf.all.arp_filter: 1
    net.ipv4.conf.all.arp_ignore: 2
    net.ipv4.conf.all.arp_announce: 2
    net.ipv4.conf.default.arp_filter: 1
    net.ipv4.conf.default.arp_ignore: 2
    net.ipv4.conf.default.arp_announce: 2

** Any valid sysctl key/value may be specified in this configuration format.
