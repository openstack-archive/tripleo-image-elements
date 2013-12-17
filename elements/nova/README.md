Install nova software from git.

Configuration
-------------

nova:
  verbose: False
    - Print more verbose output (set logging level to INFO instead of default WARNING level).
  debug: False
    - Print debugging output (set logging level to DEBUG instead of default WARNING level).
  baremetal:
    pxe_deploy_timeout: "1200"
      - the duration in seconds for pxe deployment timeouts.
    virtual_power:
      type: "virsh"
        - what virtual power driver to use. "virsh" or "vbox"
  compute_libvirt_type: "qemu"
    - what libvirt compute type. Unset will use the nova default.
