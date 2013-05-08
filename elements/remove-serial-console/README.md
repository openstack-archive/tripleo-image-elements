Remove any serial console configuration from grub.

This element removes serial console configuration from grub. Typically this
configuration is already present in the upstream cloud images, since it is
necessary for useful console output being captured by the cloud provider.
However, for local testing, this means that upstart messages are typically
not present on tty1, making manual debugging efforts very hard.
Including this element in a build, will cause "console=ttyS0" to be removed
from the kernel command line and the grub configurations.
