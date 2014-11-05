Install and configure Tuskar.

Configuration
-------------

Tuskar API requires the following keys to be set via Heat Metadata.

tuskar:
    overcloud-admin-password:
      - the password of the overcloud admin user. Use
        OvercloudAdminPassword template parameter to
        override this option.
    db: "mysql://tuskar:unset@localhost/tuskar?charset=utf8"
      - the connection string for a DB to be used by tuskar-api.
    username:
      - the name of the user to deploy the overcloud on behalf of
    password:
      - the password of the user to deploy the overcloud on behalf of
    tenant_name:
      - the tenant name of the user to deploy the overcloud on behalf of
