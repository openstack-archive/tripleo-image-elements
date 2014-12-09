Stop, disable, and exit os-collect-config

When using a non-standard updating tool (such as ansible) we want to avoid
blocking on a long running os-refresh-config process when we attempt to
perform an update. By setting /mnt/state/disable-os-collect-config and
installing this element a tool can cause os-collect-config to disable itself
early on during an initial run.
