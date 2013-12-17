Install a set of network utility scripts

Currently only installs a single script

ensure-bridge : A bridge configuration script which can be used to create
  a ovs bridge and place a network device on it. Transferring ip addresses and
  routes to the bridge. The script takes 3 parameters
  $ ensure-bridge EXTERNAL_BRIDGE PHYSICAL_INTERFACE [PUBLIC_INTERFACE_ROUTE]
  EXTERNAL_BRIDGE        : The name of the bridge to create.
  PHYSICAL_INTERFACE     : The physical interface to place on the bridge.
  PUBLIC_INTERFACE_ROUTE : Add a default route via this for all IP's except
                           169.254.169.254/32
