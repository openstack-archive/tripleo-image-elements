Install stunnel4

Configuration
-------------

None, this is a low-level element. Elements which intend using
stunnel4 should depend on this and provide their own configuration
files. By default any file matching /etc/stunnel4/\*.conf will be
picked up by stunnel.

See the stunnel man page for documentation on configuration etc.

As an example, an element which wanted stunnel to bind to port 443
externally, and forward traffic to port 80 internally would use a
config like:

    cert = /etc/ssl/certs/overcloud-servercert.pem
    key = /etc/ssl/private/overcloud-serverkey.key

    options = NO_SSLv2

    # Clients must have valid certs, according to our CA cert
    verify = 2

    [rmq-server]
      accept = {{local-ipv4}}:443
      connect = 127.0.0.1:80
