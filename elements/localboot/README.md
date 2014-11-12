Installs grub boot loader from packages.

If you want to build an image with localboot for non arm architecture:

    * Set up grub boot loader on the disk using os-refresh-config when system boot
      up and enables boot from HDD. This needs at least one PXE boot after deployment
      to work properly.
      In case Grub serial terminal support is needed, use serial-console element.

If you want to build an image with localboot for uboot arm boards:

    * uboot (when set to boot from the disk) looks on the first disk partition
      for a file named boot.scr in / or /boot.  This is a uboot
      script file, packaged in the special uboot format (like uImage and uInitrd)
      by the mkimage command, that tells uboot where the kernel and initrd are, and
      what the kernel boot arguments. This file is created by mkimage command
      using the flash-kernel script, provided by the u-boot-tools package.

    * The user must provide a uboot script file which contains kernel, initrd and console
      parameters. This file path is read from an environment variable named
      UBOOT\_SCRIPT\_FILE\_PATH.
