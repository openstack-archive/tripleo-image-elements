if [ -z "${TUSKAR_VENV_DIR:-}" ]; then
    export TUSKAR_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/tuskar"}
fi
if [ -z "${TUSKAR_EXTRA_INSTALL_OPTS:-}" ]; then
    export TUSKAR_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi
