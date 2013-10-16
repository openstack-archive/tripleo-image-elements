Install tuskar service from git.

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

Tuskar API uses Heat templates provided by tripleo-heat-templates project.
One can set the following environment variables to customize how templates
are obtained:

    - *DIB_REPOTYPE_tuskar-templates* type of repo (git, tar)
      Defaults to: git
    - *DIB_REPOLOCATION_tuskar-templates* repo location (uri)
      Defaults to: git://git.openstack.org/openstack/tripleo-heat-templates
    - *DIB_REPOREF_tuskar-templates* ref to checkout (for git repos: branch/tag/commit id)
      Defaults to: master
