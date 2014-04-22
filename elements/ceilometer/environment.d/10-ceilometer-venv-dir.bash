if [ -z "${CEILOMETER_VENV_DIR:-}" ]; then
    export CEILOMETER_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/ceilometer"}
fi
if [ -z "${CEILOMETER_EXTRA_INSTALL_OPTS:-}" ]; then
    export CEILOMETER_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi
