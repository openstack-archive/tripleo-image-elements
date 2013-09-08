Configure the OpenStack PyPI mirror globally
============================================

Temporarily overwrites /root/.pip.conf and .pydistutils.cfg to use
http://pypi.openstack.org.

By policy all tests in the OpenStack CI/CD environment need to use just the
OpenStack PyPI mirror and thus should include this element.
