Installs Apache2 from packages.

Will generate Snakeoil self signed ssl certs if the provided PEM file is
unable to pass basic validity check.

The Snakeoil SSL cert can be configured via Heat Metadata. For example:

    apache2:
        snakeoil_pem: -----  BEGIN PlaceHolder...
        snakeoil_key: -----  BEGIN PlaceHolder...

Sample usage shown in nagios3 template at:
    https://git.openstack.org/cgit/openstack/tripleo-heat-templates
