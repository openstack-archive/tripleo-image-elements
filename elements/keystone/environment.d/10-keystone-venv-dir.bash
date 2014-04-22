if [ -z "${KEYSTONE_VENV_DIR:-}" ]; then
    export KEYSTONE_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/keystone"}
fi
if [ -z "${KEYSTONE_EXTRA_INSTALL_OPTS:-}" ]; then
    export KEYSTONE_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi
