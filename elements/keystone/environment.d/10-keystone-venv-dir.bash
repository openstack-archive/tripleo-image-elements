if [ -z "${KEYSTONE_VENV_DIR:-}" ]; then
    export KEYSTONE_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/keystone"}
fi
