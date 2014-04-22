if [ -z "${GLANCE_VENV_DIR:-}" ]; then
    export GLANCE_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/glance"}
fi
if [ -z "${GLANCE_EXTRA_INSTALL_OPTS:-}" ]; then
    export GLANCE_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi
