network-gateway
===============

The network-gateway element allows for setting a network interface that will be
used as the default gateway. This is useful in deployments where they may be
external DHCP services offering leases, and the deployer would like to make the
route from one of those leases the default.

Currently only supported on ifcfg network configuration style systems.

Configuration
=============

    network-config:
      gateway-dev: eth1
