Provide configuration for seed clouds
-------------------------------------

Seed clouds are booted without any cloud infrastructure. The seed-stack-config
element stubs out enough infrastructure to permit the rest of boot-stack to
work either when booted by a cloud, or booted without.

In particular, it sets up resolv.conf, a hosts file, and delivers a Heat
metadata file with static data into the image (rather than that being delivered
at boot-time by Heat itself).

Usage
-----

Edit config.json to customise it for your deployment environment. The default
is configured for nova-baremetal operation in a seed VM. The configuration
options are documented in the actual elements that use the configuration - e.g.
nova, quantum etc.
