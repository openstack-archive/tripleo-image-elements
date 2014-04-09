os-apply-config
---------------

This element consists of two main parts, an install.d script to install
templates and an os-refresh-config script to invoke os-apply-config (thereby
applying the templates).

The install.d script looks for directories named:
  * os-config-applier - for back-compatibilty, lower precedence
  * os-apply-config - the default choice
  * post-os-apply-config - higher precedence

Files from these directories will be copied into a templates directory in the
target image, respecting structure.

The os-refresh-config script runs at level 50, if you are writing
os-refresh-config scripts for your own element which rely on templates having
been applied, ensure you use a higher level.
