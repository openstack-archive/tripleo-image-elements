Element to install haproxy. This element proxies services listed in
haproxy.services and additionally enables ports in firewall.

Configuration
-------------

haproxy:
  nodes:
  - name: notcompute
    ip: 192.0.2.5
  - name: notcomputeSlave0
    ip: 192.0.2.6
  services:
  - name: dashboard_cluster
    proxy_port: 444
    port: 443
  - name: glance_api_cluster
    proxy_port: 9293
    port:9292

You can override set of nodes for a service by setting its own set of
haproxy.nodes inside a service definition:

  services:
  - name: dashboard_cluster
    proxy_port: 444
    port: 443
    haproxy:
      nodes:
      - name: foo0
        ip: 10.0.0.1
