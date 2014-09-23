if [ -z "${OS_NET_CONFIG_VENV_DIR:-}" ]; then
    export OS_NET_CONFIG_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/os-net-config"}
fi
if [ -z "${OS_NET_CONFIG_INSTALL_OPTS:-}" ]; then
    export OS_NET_CONFIG_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi
