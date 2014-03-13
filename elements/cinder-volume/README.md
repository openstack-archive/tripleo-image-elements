Installs cinder volume service.

Configuration
-------------

    cinder:
      include_nfs_backend: False
        # set to true to add the nfs backend configuration to /etc/cinder/cinder.conf.
      nfs_shares: None
        # a list of nfs shares written to /etc/cinder/shares.txt. each item in the list
        # should be an nfs share address. (e.g 192.0.2.5:/mnt/state/var/lib/nfs_share)