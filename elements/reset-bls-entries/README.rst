reset-bls-entries
=================

This is an element which will run a script on first boot to rename
`/boot/loader/entries` filenames to match the new value of `/etc/machine-id`.
This is required for `grub2-mkconfig` calls to incorporate existing values in
the boot loader entry files.

It only runs when first-boot criteria is met, such as when `uninitialized` is
written to `/etc/machine-id`