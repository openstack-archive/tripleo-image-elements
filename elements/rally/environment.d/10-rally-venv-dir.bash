if [ -z "${RALLY_VENV_DIR:-}" ]; then
    export RALLY_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/rally"}
fi
