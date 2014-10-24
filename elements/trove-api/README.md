Install Trove-API.

Configuration
-------------

    trove:
        verbose: False
          # Print more verbose output (set logging level to INFO instead of default WARNING level).
        debug: False
          # Print debugging output (set logging level to DEBUG instead of default WARNING level).
        bind_host: 0.0.0.0
          # Binding host for the API server
        bind_port: 8779
          # Binding port for the API server
        api_workers: 5
          # Number of API service processes/threads
        rabbit:
            host: 10.0.0.1
            # For specifying single RabbitMQ node
            nodes: 10.0.0.1, 10.0.0.2
            # For specifying RabbitMQ Cluster
            username: guest
            password: guest
            port: 5672
            use_ssl: False
            virtual_host: /
        db:
          # DB Connection String
        volume_support:
            enabled: True
              # Whether to provision a cinder volume for datadir.
            block_device_mapping: vdb
            device_path: /dev/vdb
            mount_point: /var/lib/mysql
            volume_time_out: 60
            server_delete_time_out: 60
        max_accepted_volume_size: 10
          # Default maximum volume size for an instance.
        max_instances_per_user: 10
          # Default maximum number of instances per tenant.
        max_volumes_per_user: 10
          # Default maximum volume capacity (in GB) spanning across all trove volumes per tenant
        max_backups_per_user: 10
          # Default maximum number of backups created by a tenant.
        dns_support:
            enabled: True
            account_id: 123456
            dns_auth_url: 123456
            dns_username: user
            dns_passkey: password
            dns_ttl: 3600
            dns_domain_name: trove.com
            dns_domain_id: 11111111-1111-1111-1111-111111111111
            dns_driver: trove.dns.designate.driver.DesignateDriver
            dns_instance_entry_factory: trove.dns.designate.driver.DesignateInstanceEntryFactory
            dns_endpoint_url: http://127.0.0.1/v1/
            dns_service_type: dns
        admin_roles: admin
        control_exchange: trove
        log_dir: /var/log/trove
    keystone:
        auth_host: 10.0.0.1
          # Auth Host IP/Hostname
        auth_port: 5000
          # Port number on with Auth service is running
        auth_protocol: http
          # Protocol supported by Auth Service (HTTP/HTTPS)
        service_user: admin
          # Service Account Username (Admin)
        service_password:
          # Service Account Password
        service_tenant: demo
          # Service Account Tenant
    url:
        auth:
          # Keystone URL
        compute:
          # Nova Compute URL
        cinder:
          # Cinder URL
        swift:
          # Swift URL
