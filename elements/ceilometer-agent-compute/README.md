Enable the Ceilometer Agent Compute service

This should live alongside nova-compute.

Heat options:

`ceilometer.compute_agent`  whether to setup nova-compute to publish metrics for
Ceilometer to consume. Set to `Present` to do so, _empty string_ otherwise.
