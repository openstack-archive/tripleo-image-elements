Setup os-collect-config to run as a system service. By default it will
run os-refresh-config on any changes.

Configuration
-------------

Heat Metadata can be used to configure os-collect-config:

    os-collect-config:
      command: os-refresh-config
      cachedir: /var/run/os-collect-config
      collectors: heat_local,ec2,cfn
      polling_interval: 300
      cfn:
        metadata_url: http://foo:8000/v1
        heat_metadata_hint: /var/lib/heat-cfntools/cfn-metadata-server
        stack_name: required-stack-name
        access_key_id: abcdefghijklmnop091234
        secret_access_key: fffeeeeddddccccaaaa99999
        path: ThisResource.Metadata
      ec2:
        metadata_url: http://169.254.169.254/latest/meta-data
      heat_local:
        path: /var/lib/heat-cfntools/cfn-init-data

Note that `metadata_url` is optional, as it should be determined by the
file `heat_metadata_hint` refers to. This file is injected by Heat via
cloud-init at first boot. Those two parameters are the only optional
parameters. All of the others are required for the cfn data source
to function.

`ec2` and `heat_local` do not require any configuration to work.
