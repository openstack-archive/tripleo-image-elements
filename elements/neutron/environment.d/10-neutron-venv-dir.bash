if [ -z "${NEUTRON_VENV_DIR:-}" ]; then
    export NEUTRON_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/neutron"}
fi
if [ -z "${NEUTRON_EXTRA_INSTALL_OPTS:-}" ]; then
    export NEUTRON_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi
