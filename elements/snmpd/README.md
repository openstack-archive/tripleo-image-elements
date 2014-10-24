Simple Network Management Protocol (SNMP) daemon.

Installs packaged snmpd, snmp-mibs-downloader, lm-sensors and
nagios-plugins-basic.

nagios-plugins-basic is installed to provide a basic frame work for the initial
check.

Nagios style check for open file limits, per process is provided.

Creates a read only user with password for snmp v3 authentication.
exposes OoOEnabled and CheckProcOpenFiles via the NET-SNMP-EXTEND-MIB OID
block.

Grants snmp user password-less sudo access to lsof, so that the per process
check works correctly.

Options should be provided via heat. For example:

    snmpd:
        export_MIB: UCD-SNMP-MIB
        readonly_user_name: RoUser
        readonly_user_password: password
