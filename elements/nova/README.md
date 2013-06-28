Install nova software from git.

Configuration
-------------

nova:
  baremetal:
    pxe_deploy_timeout: "1200"
      - the duration in seconds for pxe deployment timeouts.
    virtual_power:
      type: "virsh"
        - what virtual power driver to use. "virsh" or "vbox"
