Install and trust a CA at the operating system level, making it available for use by
OpenStack services and other network clients authenticating SSL-secured connections.

Configuration
-------------

    ssl:
      ca_certificate: certdata

The CA certificate will be written to /etc/ssl/from-heat-ca.crt and installed using
update-ca-certificates (apt-based distros) or update-ca-trusts (yum-based distros).

This may be used in conjunction with openstack-ssl to enable SSL-secure connections
between OpenStack services, or independently to enable secure integration with
external resources such as Keystone -> LDAP server or Cinder -> external backend.

If multiple CA certificates are to be trusted, they should be concatenated in PEM
format within the single ca_certificate property defining the trust store.
