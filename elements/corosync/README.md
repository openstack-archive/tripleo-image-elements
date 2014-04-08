Installs and configures corosync element.
This will be used in pair with pacemaker for cluster resources management.

Configuration
--------------
    corosync:
        bindnetaddr: 192.0.2.10
        mcastport: 5577
    controllers:
        -
            ip : 192.0.2.10
        -
            ip : 192.0.2.14
        -
            ip : 192.0.2.18
