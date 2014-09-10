Install RabbitMQ server package and optionally configure it using Heat
metadata.

Heat
----

We will create a random password and feed it to a Heat wait condition
if directed by Metadata. The relevant Metadata would look something like
this in Heat:

    Metadata:
      rabbit:
        users:
          clean_users: True
          guest:
            username: guest
            tags: administrator
          nova:
            username: nova
            password: SuperSecret
            tags: 
              - administrator
              - monitoring
            permissions:
              conf: .*
              write: .*
              read: .*
        password_handle: {Ref: RabbitMQPasswordHandle}
        keepalive_disabled: true/false
        - Enable/Disable TCP keepalive on rabbitmq sockets (default is
        for keepalive to be enabled).

Using cfn-signal, we will feed back a generated password into the handle
for use by other resources.


RabbitMQ Cluster
----------------

Additional parameters in heat template are required for each clustered node:

    Metadata:
      rabbit:
        cookie: some_cookie
          - make sure same cookie is set for all nodes in cluster
        nodes:
          node0,node1

'rabbit.nodes' contains short hostnames of all nodes in RabbitMq cluster.

If a node has 'rabbit.nodes' set to true, this node is added into
cluster with other nodes listed in 'rabbit.nodes'.

RabbitMQ inter-node communication is restricted to port 61000 only in config file
(otherwise random ports would be used) to make sure this port can be enabled in
firewall.

Due to bug http://bugzilla.redhat.com/show_bug.cgi?id=1105850, we must use a port
within the ephemeral port range (32768-61000).

Port 61000 is reserved by using sysctl to set net.ipv4.ip_local_reserved_ports
to 61000.

Sample 2-node cluster definition:

    node0:
      rabbit:
        cookie: some_cookie
        nodes:
          Fn::Join:
          - ','
          - - Fn::Select:
              - name
              - Fn::GetAtt:
                - node0
                - show
            - Fn::Select:
              - name
              - Fn::GetAtt:
                - node1
                - show

    node1:
      rabbit:
        cookie: some_cookie
        nodes:
          Fn::Join:
          - ','
          - - Fn::Select:
              - name
              - Fn::GetAtt:
                - node0
                - show
            - Fn::Select:
              - name
              - Fn::GetAtt:
                - node1
                - show
