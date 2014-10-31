Element to install keepalived

Configuration
-------------

Configuration can be provided two ways: the simpler, deprecated, way:

    keepalived:
      # interface used for VRRP traffic
      keepalive_interface: eth0
      # initial state MASTER|BACKUP
      state: BACKUP
      # enable/disable autofailback on higher
      # priority ip being available
      preempt: false
      # Detailed Logging
      log_detail: false
      # Dumps the configuration to the logs on startup
      dump_conf: false

    virtual_ips:
      # you can define one or more virtual IPs including IPv6:
      - ip: 192.0.2.254/24
        interface: eth0
      - ip: fe80::5cc1:afff:fe58:143b/64
        interface: br-ctlplane

or the more detailed newer way for more complicated setups. If both ``virtual_interfaces`` and ``keepalived`` keys are present, the latter is ignored.

    virtual_interfaces:
      instances:
        - vrrp_instance_name: VI_CONTROL
          virtual_router_id: 51
          keepalive_interface: eth0
          priority: 101
          virtual_ips:
          - ip: 192.0.2.254/24
            interface: eth0
        - vrrp_instance_name: VI_PUBLIC
          virtual_router_id: 52
          keepalive_interface: eth0
          priority: 101
          virtual_ips:
          - ip: 10.16.15.154/24
            interface: vlan25
      vrrp_sync_groups:
        - name: VG1
          members:
            - VI_CONTROL
            - VI_PUBLIC
