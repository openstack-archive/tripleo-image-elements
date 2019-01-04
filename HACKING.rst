TripleO Style Guidelines
========================

- Step 1: Read the OpenStack Style Guidelines [1]_.
- Step 2: Read the tripleo-incubator HACKING.rst [2]_.
- Step 3: Read on.

Element Specific Guidelines
---------------------------

- Idempotency. A new version of metadata can be pushed at any time, for example
  due to a `heat stack-update`. Elements' os-refresh-config scripts must handle
  this gracefully. If they cannot be fully idempotent, they must fence their
  once-only sections.

  For example, the keepalived element's configure.d script either reloads or
  restarts the service based on whether it appears to be already running.
  Another method of fencing would be to write a marker to ephemeral storage on
  first execution and skip once-only sections if the marker is present.

References
----------
.. [1]  https://docs.openstack.org/hacking/latest/
.. [2]  http://docs.openstack.org/developer/tripleo-incubator/HACKING.html
