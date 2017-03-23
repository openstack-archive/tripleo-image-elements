overcloud-secure
================

CAUTION: This element is part of the security hardened images feature, that
is delivered in this release as tech preview. The following element is not
intended for production usage.

overcloud-secure is an element to add extra security hardening features to
the tripleo images: partition creation and unsafe package uninstall.

It includes the block-device-default definition, that creates independent
partitions on the overcloud image, allowing those to accomplish the ANSSI
security requirements. Please note that the sizes of the partitions may not
be enough for production usage, they will need to be resized properly after
deployment depending on the available disk size.
