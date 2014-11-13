Install and configure Cinder.

An appropriate target element (such as cinder-tgt or cinder-lio) must be included
in images that use cinder.

Configuration
-------------

    cinder:
      verbose: False
        - Print more verbose output (set logging level to INFO instead of default WARNING level).
      debug: False
        - Print debugging output (set logging level to DEBUG instead of default WARNING level).
      iscsi-helper: tgtadm
        - Specifies the iSCSI helper to use.  Must match the target element included in the image.
