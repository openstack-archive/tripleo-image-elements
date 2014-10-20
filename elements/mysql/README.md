Installs Percona Xtradb Cluster which is a MySQL HA solution

Mysql and mariadb elements are very similar so both depend on mysql-common
element which contains shared logic. See mysql-common for more details about
mysql setup.

Please use the mariadb-rpm on Fedora based systems.

The Percona packages are in trusty apt repository and so trusty is a
minimal requirement for this. You could use the apt-sources element
to add the percona apt mirror to your image.

Heat
----

A list of IP addresses for nodes in the cluster, the host's IP adddress, and a
cluster name must be defined in the heat metadata:

    Metadata:
      mysql:
        cluster-name: 'my_cluster'
        host: 192.0.2.3
        nodes: 192.0.2.3,192.0.2.4
