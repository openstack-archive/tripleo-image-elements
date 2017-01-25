================
overcloud-dracut
================
Rebuilds initramfs adding all the modules needed to support
TripleO needs in terms of booting whole disk images with
enabled security. We need lvm and encryption on the images,
so adding related packages and modules to enable those.
