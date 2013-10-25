Installs OpenStack Dashboard (Horizon) from git.

Horizon runs on port 80 behind Apache using mod_wsgi.


Configuration
-------------

We use the `keystone.host` key to connect to Keystone and `horizon.secret_key`
as the Django secret key.
