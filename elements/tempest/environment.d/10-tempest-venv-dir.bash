if [ -z "${TEMPEST_VENV_DIR:-}" ]; then
    export TEMPEST_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/tempest"}
fi
