Installs Nagios3 from packages.


Includes nova client used to get a list of IPs to monitor. Any found IPs are
added to the Nagios "generic-host" group which should provide basic ping and
ssh monitoring.

Access via http interface at http://<VmIp>/nagios3.
Sets the default web user name as nagiosadmin with a password of nagiosadmin.

Options to set the web password and parse nova list output for initial ip list
can be provided via heat. For example:

    nagios3:
        adm_web_passwd: nagiosadmin
        nova_host_ip: 192.0.2.1
        nova_os_password: unset
        nova_os_username: admin
        nova_os_tenant_name: admin
        initial_network_split_key: ctlplane

Sample heat template with defaults configured for a boot-stack vm located at:
  https://github.com/openstack/tripleo-heat-templates
