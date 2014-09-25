Element to install memcached

On debian-based systems, we need to set "-l 0.0.0.0" in
/etc/memcached.conf.  This is to avoid memcached
connection errors, for instance when running the Swift
proxy code. RedHat-based systems already have this
setting by default.
