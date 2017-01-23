======================
ironic-agent-multipath
======================
Updates the ironic agent, installing multipath package,
and rebuilding dracut to add the specified drivers.

The drivers to add can be specified with the
`IRONIC_AGENT_MULTIPATH_DRIVERS`. It accepts a list of
drivers to add separated by spaces. The default values are
'be2iscsi iscsi_target_mod dm_multipath'.
