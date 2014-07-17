Add sosreport to built images
=============================

This element adds sosreport to the image, for use as a log retrieval tool.

See [sosreport](https://github.com/sosreport/sos) on github for more information.

It provides the ability for plugins to be provided by other elements through the
use of sos.d in the element.  All "\*.py" files found in the sos.d directory will be added
to the plugins directory for use by sosreport.
