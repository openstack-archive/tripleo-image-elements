The fedora-rdo-icehouse element produces image builds on Fedora using RDO
packages from OpenStack Icehouse.

Any elements using an OpenStack project used in conjuction with this element
will have their install type set to package, and the packages will be installed
using the yum repository enabled by the fedora-rdo-icehouse-repository element.
