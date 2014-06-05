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
        os_auth_url: 192.0.2.1
        os_password: unset
        os_username: admin
        os_tenant_name: admin
        monitor_networks:
          - ctlplane

Sample heat template with defaults configured for a boot-stack vm located at:
  https://git.openstack.org/cgit/openstack/tripleo-heat-templates
