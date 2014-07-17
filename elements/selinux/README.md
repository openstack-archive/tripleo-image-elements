An element containing SELinux scripts

bin/add-selinux-path-substitution

Adds a path substitution from a source to a target path. Can be used to
indicate the SELinux rules that normally apply to the packaged version
of nova at /usr/bin/nova (source path) should also be applied to the
source version at /opt/stack/venvs/nova/bin/nova (target path).
