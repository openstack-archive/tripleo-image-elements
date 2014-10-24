Common element for swift elements

Configuration
-------------

    swift:
        devices: r1z<zone number>-192.0.2.6:%PORT%/d1
          - A comma separated list of swift storage devices to place in the ring
            file. 
          - This MUST be present in order for o-r-c to successfully complete.
        zones:
          - Servers are divided amongst separate zones if the swift.zones
            metadata is greater than the default of 1.  Servers are placed in zones
            depending on their rank in the scaled-out list of Swift servers in the
            yaml template used to build the overcloud stack.  The scaleout rank N
            is: SwiftStorage|controller<N>.  The appropriate zone is calculated as:
            zone = N % swift.zones + 1.
          - To enable this calculation, the devices data takes the form of:
              r1z%<controller or SwiftStorage><N>%-192.0.2.6:%PORT%/d1
        hash: randomstring
          - A hash used to salt paths on storage hosts
