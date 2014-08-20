Install a set of network utility scripts

Currently only installs a single script

ensure-bridge : A bridge configuration script which can be used to create
  a ovs bridge and place a network device on it. Transferring ip addresses and
  routes to the bridge. The script takes 3 parameters:

    $ ensure-bridge EXTERNAL_BRIDGE PHYSICAL_INTERFACE [PUBLIC_IP_CIDR [PUBLIC_INTERFACE_ROUTE]]
    EXTERNAL_BRIDGE        : The name of the bridge to create.
    PHYSICAL_INTERFACE     : The physical interface to place on the bridge.
    PUBLIC_IP_CIDR         : Optional static IP address in CIDR notation - 1.2.3.4/5
    PUBLIC_INTERFACE_ROUTE : Add a default route via this for all IP's except
                           169.254.169.254/32

  ensure-bridge also accepts:

  * --public-tag: A VLAN tag to use for creating a public IP access port on a VLAN.
  * --public-tag-ip: An IP address to put on the access port public-tag creates.
  * --bridge-route: A route "prefix via" to add to the bridge.
