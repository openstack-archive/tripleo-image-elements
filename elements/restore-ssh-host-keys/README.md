Because of poor interactions with cloud-init and nova rebuilds, we
have a timing problem when trying to store SSH host keys on the state
drive. Basically cloud-init checks for them before it mounts the state
drive.

So we're going to back them up to the state drive when we intend to do
a rebuild, and then restore them if they are present. Note that there
is not currently a standard place to do such a backup in TripleO. The
operator would need to do this before any rebuilds are issued, or expect
that machines will get new SSH host keys after rebuild.
This element will restore host keys from /mnt/state/\_ssh\_host\_keys, if
they are found.

To allow external services to determine when the ssh host key has been
restored we are appending a string to the sshd version information when a host
key is restored.
