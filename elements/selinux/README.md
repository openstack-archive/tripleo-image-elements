An element containing SELinux scripts

- bin/add-selinux-file-context

Adds a file context type to a file or a directory. It is a wrapper
script around semanage fcontext -a -t <type> <path>.

- bin/add-selinux-path-substitution

Adds a path substitution from a source to a target path. Can be used to
indicate the SELinux rules that normally apply to the packaged version
of nova at /usr/bin/nova (source path) should also be applied to the
source version at /opt/stack/venvs/nova/bin/nova (target path).

- bin/restore-selinux-file-context

Recursively restores the file context on a file or directory. It is a
wrapper script around restorecon -Rv <path>.
