Element to install keepalived

Configuration
-------------

    keepalived:
      # interface used for VRRP traffic
      keepalive_interface: eth0
      # initial state MASTER|BACKUP
      state: BACKUP
      # enable/disable autofailback on higher
      # priority ip being available
      preempt: false

    virtual_ips:
      # you can define one or more virtual IPs including IPv6:
      - ip: 192.0.2.254/24
        interface: eth0
      - ip: fe80::5cc1:afff:fe58:143b/64
        interface: br-ctlplane
