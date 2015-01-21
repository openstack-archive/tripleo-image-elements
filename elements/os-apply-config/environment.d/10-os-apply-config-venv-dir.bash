if [ -z "${OS_APPLY_CONFIG_VENV_DIR:-}" ]; then
    export OS_APPLY_CONFIG_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/os-apply-config"}
fi
