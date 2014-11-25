Element to install bandersnatch

Installs a bandersnatch pypi mirror in the image, when booted a cronjob will
populate the mirror and keep it uptodate.

Note: Booting an image including this element will result in a full mirror
of https://pypi.python.org (over 100G of of data being downloaded), don't
do this unless that is your intention.
