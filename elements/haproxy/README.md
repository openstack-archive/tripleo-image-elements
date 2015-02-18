Element to install haproxy. This element proxies services listed in
haproxy.services and additionally enables ports in firewall.

Configuration
-------------

The following properties are supported for configuring haproxy

* haproxy.services: A list of listen <name> blocks. Also supports proxy_ip and
  proxy_port sub-properties.
* haproxy.nodes: A list of server <name> <ip>:<port> lines. These are added to
  any haproxy.services which do not define this sub-property.
* haproxy.stats.disabled: Set to true to disable the stats service
* haproxy.stats.port: Port for the stats service. Defaults to 1993.
* haproxy.stats.uri: URI for the stats service. Defaults to /.
* haproxy.global_maxconn: A limit on the total number of concurrent connections
  that will be handled by a haproxy instance. haproxy will stop accepting
  connections above this limit.
* haproxy.service_maxconn: A limit on the number of the number of concurrent
  connections that are allowed to each proxied service. This is a default value
  that can be overridden in an individual haproxy.service section.
* haproxy.timeout.http-request: Set the maximum default allowed time to wait
  for a complete HTTP request.
* haproxy.timeout.queue: Set the maximum default time to wait in the queue for
  a connection slot to be free.
* haproxy.timeout.connect: Set the maximum default time to wait for a
  connection attempt to a server to succeed.
* haproxy.timeout.client: Set the maximum default inactivity time on the client
  side.
* haproxy.timeout.server: Set the maximum default inactivity time on the server
  side.
* haproxy.timeout.check: Set additional check timeout, but only after a
  connection has been already established.

Each haproxy.services can define the following sub-properties

* name: A name for the service.
* haproxy.nodes: Same as above. This overrides the global haproxy.nodes list if
  it is set.
* net_binds: A list of ip addresses and ports to bind to. Each element in the
  list must define a port and can define an IP. If no IP is defined then the
  service binds to all IP's.
* balance: *DEPRECATED* A balancing strategy for the service. Defaults to source.
* port: Port to connect to for each of the haproxy.nodes.
* options: A list of arbitrary params (eg. timeout server 1h) to be configured
  for the listener
* extra_server_params: A list of parameters that will be appended to each
  backend server line that is generated.
* proxy_ip: *DEPRECATED* IP address for a service to bind to. Defaults to all
  IP's (0.0.0.0).
* proxy_port: *DEPRECATED* Port for a service to bind to.
* service_maxconn: A limit on the number of concurrent connections allowed to
  this service.
* check_interval: The interval between two consecutive health checks in milliseconds.

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
        net_binds:
        - ip: 192.0.2.3
          port: 443
        - ip: 192.0.2.3
          port: 444
        balance: roundrobin
      - name: glance_api_cluster
        proxy_ip: 192.0.2.3
        proxy_port: 9293
        port:9292
        balance: source
      - name: mysql
        port: 3306
        extra_server_params:
        - backup

You can override set of nodes for a service by setting its own set of
haproxy.nodes inside a service definition:

    services:
    - name: dashboard_cluster
      net_binds:
      - ip: 192.0.2.3
        port: 444
      - port: 443
      balance: source
      haproxy:
        nodes:
        - name: foo0
          ip: 10.0.0.1

You can provide net_binds only once, for example:

    haproxy:
      nodes:
        - name: foo0
          ip: 10.0.0.1
      net_binds:
        - ip: 192.0.2.3
      services:
        - name: keystone
          port: 5000
        - name: dashboard_cluster
          port: 80
          net_binds:
          - ip: 192.0.2.10

If there is no haproxy.services.net_binds.port defined - haproxy.services.port
will be used.
