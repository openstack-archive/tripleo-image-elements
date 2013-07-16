Simple Network Management Protocol (SNMP) daemon.

Installs packaged snmpd, snmp-mibs-downloader, and lm-sensors. Creates a
read only user with password for snmp v3 authentication.

Enabling the SNMP daemon allows more advanced monitoring of the deployed nodes.


Options should be provided via heat. For example:
    snmp:
        MIB: UCD-SNMP-MIB
        readonly_user_name: RoUser
        readonly_user_password: password
