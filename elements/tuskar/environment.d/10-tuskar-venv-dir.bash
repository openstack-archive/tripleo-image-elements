if [ -z "${TUSKAR_VENV_DIR:-}" ]; then
    export TUSKAR_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/tuskar"}
fi
