Install and configure Nova.

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
      image_cache_manager_interval:
        - Number of seconds to wait between runs of the image cache manager.
      resize_fs_using_block_device: BoolOpt
        - Attempt to resize the filesystem by accessing the image over a block device.
      resume_guests_state_on_host_boot: BoolOpt
        - Whether to start guests that were running before the host rebooted.
      running_deleted_instance_action:
        - Action to take if a running deleted instance is detected.
          Valid options are: 'noop', 'log', 'shutdown', or 'reap'.
          Set to 'noop' to take no action.
      virt_mkfs:
        - Name of the mkfs commands for ephemeral device.
          The format is <os_type>=<mkfs command>
          e.g. 'linux-ext4=mkfs -t ext4 -F -L %(fs_label)s %(target)s'
      compute_manager: "ironic.nova.compute.manager.ClusterComputeManager"
        - set to override the compute manager class used by Nova-Compute.
      scheduler_host_manager: "nova.scheduler.ironic_host_manager.IronicHostManager"
        - set to override the scheduler host manager used by Nova. If no
          scheduler_host_manager is configured it is automatically set to
          the deprecated Nova baremetal and/or the old in-tree Ironic
          compute driver for Nova.
      public_ip:
        - public IP address (if any) assigned to this node. Used for VNC proxy
          connections so this is typically only required on controller nodes.
