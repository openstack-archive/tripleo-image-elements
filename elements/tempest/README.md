Add the tempest cloud test suite to an image.

The purpose of this element is to run tempest as a gate for tripleo based ci.

To successfully run tempest your overcloud should have
* Nodes with at least 4G of memory and 20G of diskspace
* the following services should be running
  cinder, glance, heat, keystone, neutron, nova and swift

To use you should simply run the command run-tempest with the
OS_* environment variables for admin defined.

Tempest configuration may be overwritten via pass-through.
tempest-run configuration is defined in etc/tempestrunrc; values in there
may be overwritten using ExtraConfig.

TODO:
* Remove as many of the filters in tests2skip.txt as possible
* Investigate setting run_ssh to true
