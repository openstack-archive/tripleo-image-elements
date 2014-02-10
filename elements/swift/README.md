Common element for swift elements

Configuration
-------------
swift:
    devices: r1z1-192.0.2.6:%PORT%/d1
      - A comma separated list of swift storage devices to place in the ring
        file. This MUST be present in order for o-r-c to successfully complete.
    hash: randomstring
      - A hash used to salt paths on storage hosts
