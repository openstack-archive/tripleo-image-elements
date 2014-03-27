if [ -z "${GLANCE_VENV_DIR:-}" ]; then
    export GLANCE_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/glance"}
fi
