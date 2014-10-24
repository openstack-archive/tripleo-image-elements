Installs Qpid as a substitute for RabbitMQ as the rpc_backend for
various OpenStack services.

To use Qpid, when building an image, add the qpid element and
remove the rabbitmq-server element. At the moment, rabbitmq-server
is listed as default in boot-stack/element-deps.

    sed -i "s/rabbitmq-server/qpidd/" $TRIPLEO_ROOT/tripleo-image-elements/elements/boot-stack/element-deps

The configuration files of other services like Heat, Neutron, Nova,
Cinder, and Glance are updated by os-apply-config and os-apply-config
will place the correct configurations for either RabbitMQ or Qpid
depending on what is present in the Heat metadata.

The Heat metadata/templates should be updated to use qpid instead
of rabbitmq. In addition to the password which rabbitmq lists by
default, the username should also be specified for qpid.


For the seed image the default metadata on the file system needs
to be updated. Substitute "rabbit" with "qpid".

    sed -i "s/rabbit/qpid/" $TRIPLEO_ROOT/tripleo-image-elements/elements/seed-stack-config/config.json

After including the username, the qpid section should look like

    "qpid": {
      "host": "127.0.0.1",
      "username": "guest",
      "password": "guest"
      }


For the undercloud, update the Heat template by substituting "rabbit:"
with "qpid:".

    sed -i "s/rabbit:/qpid:/" $TRIPLEO_ROOT/tripleo-heat-templates/undercloud-vm.yaml

After including the username, the qpid section should look like

    qpid:
      host: 127.0.0.1
      username: guest
             password: guest


For the overcloud, update the Heat template by substituting "rabbit:"
with "qpid:".

    sed -i "s/rabbit:/qpid:/" $TRIPLEO_ROOT/tripleo-heat-templates/overcloud.yaml

After including the username, the qpid section(s) should look like

    qpid:
      host:
        Fn::GetAtt:
        - notcompute
        - PrivateIp
      username: guest
      password: guest
