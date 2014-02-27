if [ -z "${IRONIC_VENV_DIR:-}" ]; then
    export IRONIC_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/ironic"}
fi
if [ -z "${IRONIC_EXTRA_INSTALL_OPTS:-}" ]; then
    export IRONIC_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi
