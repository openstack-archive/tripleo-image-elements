if [ -z "${NEUTRON_VENV_DIR:-}" ]; then
    export NEUTRON_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/neutron"}
fi
