Configure stunnel4 for local services.

Configuration
-------------

stunnel:
  cert: certdata
  key: keydata
  ports:
   - name: 'ec2'
     accept: 13773
     connect: 8773
   - name: 'image'
     accept: 13292
     connect: 9292
   - name: 'identity'
     accept: 13000
     connect: 5000
   - name: 'network'
     accept: 13696
     connect: 9696
   - name: 'compute'
     accept: 13774
     connect: 8774
   - name: 'swift-proxy'
     accept: 13080
     connect: 8080
   - name: 'cinder'
     accept: 13776
     connect: 8776
     connect_host: localhost

The certificate and key data will be written to /etc/ssl/from-heat.{crt,key}.

The certificate and key will be held persistently by Heat, so only use this with
an SSL enabled heat, and as soon as bug 1269999 is fixed, we will migrate away
from this implementation.

Note that the public API endpoints in keystone need to be registered with https
urls, which is outside the scope of the local machine configuration process.

See the stunnel man page for documentation on crt and key formats etc.
