if [ -z "${IRONIC_VENV_DIR:-}" ]; then
    export IRONIC_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/ironic"}
fi
