if [ -z "${HORIZON_VENV_DIR:-}" ]; then
    export HORIZON_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/horizon"}
fi
if [ -z "${HORIZON_EXTRA_INSTALL_OPTS:-}" ]; then
    export HORIZON_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi
