if [ -z "${HEAT_VENV_DIR:-}" ]; then
    export HEAT_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/heat"}
fi
if [ -z "${HEAT_EXTRA_INSTALL_OPTS:-}" ]; then
    export HEAT_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi
