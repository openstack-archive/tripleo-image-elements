Setup ntpd and optionally configure it using Heat metadata.

Heat Metadata can be used to specify the configuration:

    ntp:
      servers:
        - { server: server1.foo.example }
        - { server: server2.foo.test, fudge: stratum 0 }
