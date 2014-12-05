Setup os-collect-config to run as a system service. By default it will
run os-refresh-config on any changes.

Configuration
-------------

Heat Metadata can be used to configure os-collect-config:

    os-collect-config:
      command: os-refresh-config
      cachedir: /var/run/os-collect-config
      collectors:
        - heat_local
        - ec2
        - cfn
      polling_interval: 300
      cfn:
        metadata_url: http://foo:8000/v1
        heat_metadata_hint: /var/lib/heat-cfntools/cfn-metadata-server
        stack_name: required-stack-name
        access_key_id: abcdefghijklmnop091234
        secret_access_key: fffeeeeddddccccaaaa99999
        path: ThisResource.Metadata
        ca_certificate: /etc/ssl/ca.crt
      ec2:
        metadata_url: http://169.254.169.254/latest/meta-data
      heat_local:
        path: /var/lib/heat-cfntools/cfn-init-data

Note that `metadata_url` is optional, as it should be determined by the
file `heat_metadata_hint` refers to. This file is injected by Heat via
cloud-init at first boot. Those two parameters are the only optional
parameters. All of the others are required for the cfn data source
to function. Note that `ca_certificate` is also optional but required
in many cases where the metadata api is behind ssl.

`ec2` and `heat_local` do not require any configuration to work.

Typically the cfn collector is configured via EC2 metadata in a Heat
template:

    Resources:
      myserver:
        Type: OS::Nova::Server
        Properties:
          ...
        Metadata:
          os-collect-config:
            cfn:
              access_key_id:
                Ref: Key
              path: MyServerConfig.Metadata
              secret_access_key:
                Fn::GetAtt:
                - Key
                - SecretAccessKey
              stack_name:
                Ref: AWS::StackName
              ca_certificate: /etc/ssl/ca.crt

The EC2 collector takes this metadata, passes it to os-apply-config
which in turn writes it out to /etc/os-collect-config.conf.

Note that the configuration references some other resources - a key
and access key, which are declared using:

    Resources:
      Key:
        Properties:
          UserName:
            Ref: User
        Type: AWS::IAM::AccessKey
      User:
        Properties:
          Policies:
          - Ref: AccessPolicy
        Type: AWS::IAM::User

Note also that the IAM::User references an access policy which should
look like:

    Resources:
      AccessPolicy:
        Properties:
          AllowedResources:
          - MyServerConfig
        Type: OS::Heat::AccessPolicy

and, finally, the crucial bit is the MyServerConfig policy which is
referenced in the cfn collector configuration and the access policy:

    Resources:
      MyServerConfig:
        Metadata:
          os-collect-config:
            cfn:
              access_key_id:
                Ref: Key
              path: MyServerConfig.Metadata
              secret_access_key:
                Fn::GetAtt:
                - Key
                - SecretAccessKey
              stack_name:
                Ref: AWS::StackName
          nova:
            ...
          keystone:
            ...
        Properties:
          ImageId: '0'
          InstanceType: foo
        Type: AWS::AutoScaling::LaunchConfiguration

Essentially, this AutoScaling::LaunchConfiguration resource is a bunch
of boilerplate gunk to provide a metadata container from where the
os-collect-config cfn collector can pull configuration which will be
applied by os-apply-config. There's a os-collect-config section to
ensure the configuration from the EC2 metadata doesn't get
overwritten. And the rest is dummy values for the
LaunchConfiguration's required properties.

