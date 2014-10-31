Install and configure OpenStack Dashboard (Horizon).

Horizon runs on port 80 behind Apache using mod_wsgi.


Configuration
-------------

We use the `keystone.host` key to connect to Keystone and `horizon.secret_key`
as the Django secret key.

The Django sessions storage backend is set to LocMemCache by default. If
`horizon.caches.memcached` is found instead not empty, the sessions storage
backend is set to Memcached and the control nodes are configured as memcached
locations.