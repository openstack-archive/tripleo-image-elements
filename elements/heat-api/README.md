Run the stateless HTTP Heat API services.

Configuration
-------------

We use os-apply-config for writing heat's configuration.

Example Heat Metadata:

    OpenStack::Config:
      heat:
        rpc_backend: heat.openstack.common.rpc.impl_kombu
        service_host: keystone.host.foo
        service_port: 5000
        keystone:
          auth_host: keystone.host.foo
          auth_port: 35357
          auth_protocol: http
          auth_uri: http://keystone.host.foo:35357/v2.0
        admin_tenant_name: mytenant
        admin_user: user1
        admin_password: abcdefg
        rabbit:
          host: rabbitmq.host.foo
          password: xyz123
