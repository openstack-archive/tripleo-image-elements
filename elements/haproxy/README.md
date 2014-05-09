Element to install haproxy. This element proxies services listed in
haproxy.services and additionally enables ports in firewall.

Configuration
-------------

The following properties are supported for configuring haproxy

* haproxy.services: A list of listen <name> blocks. Also supports proxy_ip and
  proxy_port sub-properties.
* haproxy.nodes: A list of server <name> <ip>:<port> lines. These are added to
  any haproxy.services which do not define this sub-property.

Each haproxy.services can define the following sub-properties

* name: A name for the service.
* proxy_ip: IP address for a service to bind to. Defaults to all IP's.
* proxy_port: Port for a service to bind to.
* balance: A balancing strategy for the service. Defaults to source.
* port: Port to connect to for each of the haproxy.nodes.
* haproxy.nodes: Same as above. This overrides the global haproxy.nodes list if
  it is set.

Each haproxy.nodes can define the following sub-properties

* name: A name for the node.
* ip: IP address to connect to for the node.
* port: Port to connect to for the node. This overrides any port value defined
  in haproxy.services.

If haproxy is configured to bind to a virtual IP with keepalived
sysctl must be configured to use "net.ipv4.ip_nonlocal_bind = 1"
This setting allows allows a program like HA-Proxy to create listening sockets
on network interfaces that do not actually exist on the server.
* This can be set in heat meatadata for node properties.
EX: in overcloud-source.yaml for controllerConfig under properties:
        sysctl:
          net.ipv4.ip_nonlocal_bind: 1


Example Configurations
----------------------

haproxy:
  nodes:
  - name: notcompute
    ip: 192.0.2.5
  - name: notcomputeSlave0
    ip: 192.0.2.6
  services:
  - name: dashboard_cluster
    proxy_ip: 192.0.2.3
    proxy_port: 444
    port: 443
    balance: roundrobin
  - name: glance_api_cluster
    proxy_ip: 192.0.2.3
    proxy_port: 9293
    port:9292
    balance: source

You can override set of nodes for a service by setting its own set of
haproxy.nodes inside a service definition:

  services:
  - name: dashboard_cluster
    proxy_ip: 192.0.2.3
    proxy_port: 444
    port: 443
    balance: source
    haproxy:
      nodes:
      - name: foo0
        ip: 10.0.0.1
