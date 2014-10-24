Install and configure Ironic.

Required options can be provided via heat.
For example:

    ironic:
      db: mysql://ironic:unset@192.0.2.2/ironic
      service-password: unset
    keystone:
      host: 192.0.2.2
    glance:
      host: 192.0.2.2
    rabbit:
      host: 192.0.2.2
      password: guest

