if [ -z "${NOVA_VENV_DIR:-}" ]; then
    export NOVA_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/nova"}
fi
