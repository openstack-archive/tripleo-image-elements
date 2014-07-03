The rhel7-rdo-icehouse element produces image builds on RHEL7 using RDO
packages from OpenStack Icehouse.

Any elements using an OpenStack project used in conjuction with this element
will have their install type set to package via package-installs element, and
the packages will be installed using the yum repository enabled by the
rdo-icehouse and rdo-release elements.
