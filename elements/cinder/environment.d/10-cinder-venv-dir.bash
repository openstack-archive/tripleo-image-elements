if [ -z "${CINDER_VENV_DIR:-}" ]; then
    export CINDER_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/cinder"}
fi
