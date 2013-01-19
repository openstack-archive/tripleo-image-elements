Run the heat-engine service.

Configuration
-------------

Example Heat Metadata:

    OpenStack::Config:
      heat:
        rpc_backend: heat.openstack.common.rpc.impl_kombu
        sql_connection: mysql://heatuser:heatpass@mysql.server.foo/heatdb
        auth_encryption_key: 0123456789abcdef0123456789abcdef
        watch_server_url: http://address.of.watch.service:8003
        waitcondition_server_url: http://address.of.wc.service:8000/v1/waitcondition
        metadata_server_url: http://addr.of.metadta.service:8000
        rabbit:
          password: abcdefg
          host: address.of.rabbitmq
        bind_port: 8001
        bind_host: 0.0.0.0
