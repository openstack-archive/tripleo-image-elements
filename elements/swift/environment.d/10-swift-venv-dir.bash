if [ -z "${SWIFT_VENV_DIR:-}" ]; then
    export SWIFT_VENV_DIR=${OPENSTACK_VENV_DIR:-"/opt/stack/venvs/swift"}
fi
if [ -z "${SWIFT_EXTRA_INSTALL_OPTS:-}" ]; then
    export SWIFT_EXTRA_INSTALL_OPTS=${OPENSTACK_EXTRA_INSTALL_OPTS:-""}
fi
