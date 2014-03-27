if [ -z "${CEILOMETER_VENV_DIR:-}" ]; then
    export CEILOMETER_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/ceilometer"}
fi
