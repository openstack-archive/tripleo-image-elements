if [ -z "${OS_COLLECT_CONFIG_VENV_DIR:-}" ]; then
    export OS_COLLECT_CONFIG_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/os-collect-config"}
fi
