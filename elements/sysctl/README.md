Manages sysctl settings.

There are four ways to make use of this element:

1) Elements can make use of sysctl-set-value directly by requiring
this element and calling /usr/local/bin/sysctl-set-value. This will
help ensure conflicting sysctl values are not in use across elements.
Please note that this script calls sysctl -p, which will set the sysctl
value on the build host while the image is building, which may be
unintended.

2) Elements can make use of sysctl-write-value directly by requiring
this element and calling /usr/local/bin/sysctl-write-value. This script
does not verify values, or set them on the build host, it only writes the
files into the image, so that the values will be set when the image is
booted.

3) Elements can make use of sysctl-append-value to set values that
complement values set by other elements, rather than overwriting or
conflicting with them. This script also does not set the sysctl value
on the build host.

4) Alternately you can make use of the element via Heat by adding
metadata in the configuration example below. sysctl-set-value
will take care of applying these settings during configuration time.

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
