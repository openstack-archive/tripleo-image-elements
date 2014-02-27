if [ -z "${CINDER_VENV_DIR:-}" ]; then
    export CINDER_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/cinder"}
fi
if [ -z "${CINDER_EXTRA_INSTALL_OPTS:-}" ]; then
    export CINDER_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi
