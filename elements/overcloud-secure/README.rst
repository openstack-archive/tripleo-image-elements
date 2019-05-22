overcloud-secure
================

overcloud-secure is an element to add extra security hardening features to
the tripleo images: partition creation and unsafe package uninstall.

It includes the block-device-default definition, that creates independent
partitions on the overcloud image, allowing those to accomplish the ANSSI
security requirements. Please note that the sizes of the partitions may not
be enough for production usage, they will need to be resized properly after
deployment depending on the available disk size.
