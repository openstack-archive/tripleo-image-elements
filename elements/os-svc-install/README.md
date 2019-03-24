Command line utilities to simplify installation of OpenStack services.

## os-svc-install
Given a git repo url, pip-install the repo and all of its python dependencies into a virtualenv.
NOTE: By default the virtualenv is installed to /opt/stack/venvs/SERVICENAME but this can be customized.
NOTE: By default services do not autostart until os-svc-enable is called.

## os-svc-daemon
Given a system service command line and run-as user, generate and install system service start script. See output of `os-svc-daemon -h` for online help.

## os-svc-enable
Enable the given service name so it starts on boot.
This is typically called in an os-refresh-config/post-configure.d script to
enable a service once it has been fully configured.

## os-svc-enable-upstart (upstart distros only)
Given an upstart job and an action, acts on the enabled or disabled state
of jobs produced by os-svc-daemon. This requires the os-svc-enable upstart
job which is installed by this element as well. There is also an action,
'enabled', which allows checking whether or not a service is enabled;
the command exits 0 if it is enabled, or 1 if it is not. A disabled
service will not be started automatically nor can it be manually started.

## example usage
```bash
# clone nova, and install it and its dependencies to /opt/stack/venvs/nova
os-svc-install -u nova -r https://git.openstack.org/openstack/nova.git

# install a system-start script for nova-api
os-svc-daemon -e 'foo=bar bar=baz' -n nova-api -u nova -c /opt/stack/venvs/nova/bin/nova-api -- --config-dir /etc/nova

# enable nova-api so that it starts on boot
os-svc-enable -n nova-api
```
