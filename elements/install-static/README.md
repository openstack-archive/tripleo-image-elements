Copy static files.

The contents of any ``static/`` subdirs of elements will be installed into
these images at build time using ``rsync -lCr``. So to install a file
``/etc/boo``, include ``static/etc/boo`` in your element.
