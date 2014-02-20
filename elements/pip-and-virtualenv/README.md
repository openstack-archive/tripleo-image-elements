Install latest pip and virtualenv
=================================

We have problems with the latest binary package of pip and virtualenv.
Packaged version of pip can be old and virtualenv can also contain its
own version of pip. Issues include downloading packages from a local
pypi mirror that include a wheel package for pip.

The element follows the instructions from the pip website here:
http://www.pip-installer.org/en/latest/installing.html on how to install
the latest version of pip. That is to download get-pip.py and run this
file.

We use source-repositories element to download the file so it will be
cached and can be overridden to use package if that is required.
