Element to install bandersnatch

Installs a bandersnatch pypi mirror in the image, when booted a cronjob will
populate the mirror and keep it up to date.

Note: Booting an image including this element will result in a full mirror
of https://pypi.python.org (over 100G of data being downloaded), do not
do this unless that is your intention.
