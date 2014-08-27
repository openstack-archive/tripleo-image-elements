The fedora-rdo-icehouse element produces image builds on Fedora using RDO
packages from OpenStack Icehouse.

Any elements using an OpenStack project used in conjunction with this element
will have their install type set to package via enable-packages-install element,
and the packages will be installed using the yum repository enabled by the
rdo-icehouse and rdo-release elements.
