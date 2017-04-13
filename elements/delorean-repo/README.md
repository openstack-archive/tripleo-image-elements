Configure the image to pull packages from a Delorean repo

This element configures the image such that it downloads
packages from the specified Delorean repository. To use set
DELOREAN\_REPO\_URL to the Delorean repo you'd like to use.
This can be 'current' or any revision in the past that you'd
like to use. Example:

 export DELOREAN\_REPO\_URL=http://localhost/~user/repos/current

Delorean is a tool that can be used to automate building upstream
packages:

 https://github.com/openstack-packages/delorean

The Delorean tool currently supports Fedora packages and Yum
repositories. Support for other distributions may be added in
the future.
