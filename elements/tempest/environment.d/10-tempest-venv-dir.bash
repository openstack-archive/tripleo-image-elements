if [ -z "${TEMPEST_VENV_DIR:-}" ]; then
    export TEMPEST_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/tempest"}
fi
if [ -z "${TEMPEST_EXTRA_INSTALL_OPTS:-}" ]; then
    export TEMPEST_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi
