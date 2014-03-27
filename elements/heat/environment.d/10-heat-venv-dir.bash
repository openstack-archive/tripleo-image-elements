if [ -z "${HEAT_VENV_DIR:-}" ]; then
    export HEAT_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/heat"}
fi
