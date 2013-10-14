Provides tools to aid in relocating state to /mnt/state

In a cloud instance /mnt/state is on the cloud ephemeral device when one
exists, or the root when one doesn't.

The pattern for having state on /mnt/state is:

- The service/daemon can make its own state files on startup (as /mnt
  is always empty on first-boot).

- Alternatively os-refresh-config can be used to populate any initial state so
  that the daemon/service works (so until the first os-refresh-config run that
  daemon/service will be broken).

- If the state needs migrating (e.g. PostgreSQL 9.1 to 9.2) then a migration
  script should be added to os-refresh-config's migrations.d tree to perform
  that migration that state (if the migration can be done after the service
  starts) or to configure.d if the service cannot start without the migration
  being done).

- state should live in /mnt/state/original-path e.g.
  /mnt/state/etc/ssh/ssh\_host\_dsa\_key.

- where there are hardcoded specific paths, we leave symlinks in that path
  pointing into /mnt/state - e.g. /etc/ssh/ss\_host\_dsa\_key will be a symlink
  to /mnt/state/etc/ssh/ssh\_host\_dsa\_key.

To factor out common code elements can invoke register-state-path during
install.d to request that a particular path be registered as a stateful path.

- If there is content at the path at registration time, it will be moved to
  /var/lib/use-ephemeral/original-path.

- If --leave-symlink is passed, a symlink will be created at that path pointing
  to /mnt/state/original-path.

- Stateful paths are listed in /var/lib/use-ephemeral/stateful-paths, one path
  per line - e.g. /etc/ssh/ssh\_host\_dsa\_key.

Once registered:

- During pre-configure.d the parent directories leading up to the path will be
  asserted on startup.

- If there is a content at /var/lib/use-ephemeral/original-path during
  pre-configure.d, and the new path does not exist in /mnt/state then an
  rsync -a will be made into /mnt/state/original-path reinstating a pristine
  copy of what was preserved. This is only done when the path does not exist
  to avoid corrupting evolved or migrated state.
