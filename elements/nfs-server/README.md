Installs and configures NFS server services.

When added to an image this element will, depending on the
config data, create a number of NFS shares and export them to
the given list of clients with respective options.

Shares are created in /mnt/state/var/lib/nfs

Configuration
-------------

    nfs_server:
      shares:
      - name: share_name
        clients:
        - machine: machine_allowed
          options: rw,async,no_root_squash

**NOTE**:

* `share_name` should be a valid POSIX dirname, special chars, spaces or
use of quotes is not supported

* share dir created on filesystem will be owned by root/root with mode 0770

* `machine` is required, defines the list of allowed clients, can be repeated

* `options` can be omitted the following are used: rw,async,no_root_squash