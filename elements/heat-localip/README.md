Update cfn-init-data with the instance local-ip.

This updates the cached metadata before os-config-applier is run by replacing
0.0.0.0 with the local-ipv4 value from the Nova metadata service.

Currently heat has no way to specify using the local-ip on first-run, rather it
waits for an update to the metadata by phoning home. By updating the metadata
before the first run of os-config-applier, we ensure the metadata is always
consistent.
