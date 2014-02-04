Configure the OpenStack PyPI mirror globally
============================================

Temporarily overwrites /root/.pip.conf and .pydistutils.cfg to use
http://pypi.openstack.org.

By policy all tests in the OpenStack CI/CD environment need to use just the
OpenStack PyPI mirror and thus should include this element.

Note that when building images with this element, pip uses HTTP, and the
OpenStack mirror does not provide a way to verify the contents of the
downloaded packages, and thus is vulnerable to a man-in-the-middle attack.

In order to have a secure local mirror which is built in the same way
pypi-openstack is, see the diskimage-builder element 'pypi'. If you would
like to build an image which hosts such a mirror, see the pypi-mirror
element.
