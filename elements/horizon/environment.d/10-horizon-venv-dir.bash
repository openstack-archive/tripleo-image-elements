if [ -z "${HORIZON_VENV_DIR:-}" ]; then
    export HORIZON_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/horizon"}
fi
