Install postfix from packages.

Currently this element is valid only for Debian and Debian derived systems.

Sets default install type to local-only so we dont spam anyone. This can be
overwritten with the DIB_POSTFIX_INSTALL_TYPE environmental variable.

Valid options for DIB_POSTFIX_INSTALL_TYPE are:
    Local only
    Internet Site
    Internet with smarthost
    Satellite system
